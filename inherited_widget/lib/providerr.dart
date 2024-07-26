import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatelessWidget {
  const MyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return Company(companyName: "Google", empCount: 250);
      },
      child: const MaterialApp(
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
        ],
      ),
    );
  }
}

class Company {
  String companyName;
  int empCount;

  Company({required this.companyName, required this.empCount});
}
