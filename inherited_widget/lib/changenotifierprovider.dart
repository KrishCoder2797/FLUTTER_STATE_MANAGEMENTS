import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNotifierProvider extends StatelessWidget {
  const MyNotifierProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Company(companyName: "Google", empCount: 250);
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainApp(),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State createState() => _MainAppState();
}

class _MainAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Provider State Management"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 400),
          Text(Provider.of<Company>(context).companyName),
          const SizedBox(height: 30),
          Text("${Provider.of<Company>(context).empCount}"),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(          
              onPressed: () {
                Provider.of<Company>(context, listen: false)
                    .changeData("Facebook", 300);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Change Company",
                ),
              ))
        ],
      ),
    );
  }
}

class Company extends ChangeNotifier {
  String companyName;
  int empCount;

  Company({required this.companyName, required this.empCount});
// Manually data change sathi ek method lihitoy

  void changeData(String companyName, int empCount) {
    this.companyName = companyName;
    this.empCount = empCount;

    // hi method build la call krte nantr UI update hoto

    notifyListeners();
  }
}
