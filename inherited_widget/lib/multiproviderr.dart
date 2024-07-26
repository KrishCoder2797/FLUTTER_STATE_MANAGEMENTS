import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMultiProvider extends StatelessWidget {
  const MyMultiProvider({super.key});

  @override
  Widget build(BuildContext context) {
    // Multiproviders means list of providers ...
    return MultiProvider(
      providers: [
        Provider(create: (context) {
          return Employee(empName: "Krish", empId: 10);
        }),
        ChangeNotifierProvider(create: (context) {
          return Project(projectName: "HealthCare", devType: "Backend Dev");
        })
      ],
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
        title: const Text("Multi Provider State Management"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 400),
          Text("Employee Name : ${Provider.of<Employee>(context).empName}"),
          const SizedBox(height: 30),
          Text("Employee Id : ${Provider.of<Employee>(context).empId}"),
          const SizedBox(
            height: 30,
          ),
          Text("Project Name : ${Provider.of<Project>(context).projectName}"),
          const SizedBox(height: 30),
          Text("Devlopment Type : ${Provider.of<Project>(context).devType}"),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Provider.of<Project>(context, listen: false)
                    .changeProject("Entertainment", "Frontend Dev");
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Change Project",
                ),
              ))
        ],
      ),
    );
  }
}

class Employee {
  String empName;
  int empId;

  Employee({required this.empName, required this.empId});
}

class Project with ChangeNotifier {
  String projectName;
  String devType;

  Project({required this.projectName, required this.devType});

  void changeProject(String projectName, String devType) {
    this.projectName = projectName;
    this.devType = devType;

    notifyListeners();
  }
}
