import "dart:developer";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class Login with ChangeNotifier {
  String userName;
  String password;
  Login({required this.userName, required this.password});
  void changePassword(String password) {
    this.password = password;
    notifyListeners();
  }
}

class Employee with ChangeNotifier {
  final int empId;
  final String empName;
  final String userName;
  final String password;
  Employee(
      {required this.empId,
      required this.empName,
      required this.userName,
      required this.password});
}

class MyProxyProvider extends StatelessWidget {
  const MyProxyProvider({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            log("IN CHANGENOTIFIER PROVIDER CREATE ");
            return Login(
              userName: "Kanha@12",
              password: "kanha#1991",
            );
          },
        ),
        ChangeNotifierProxyProvider<Login, Employee>(
          create: (context) {
            log("IN CREATE ");
            return Employee(
              empId: 12,
              empName: "Kanhaiya",
              userName: Provider.of<Login>(context, listen: false).userName,
              password: Provider.of<Login>(context, listen: false).password,
            );
          },
          update: (context, login, employee) {
            log("IN UPDATE");
            return Employee(
              empId: 12,
              empName: "Kanhaiya",
              userName: login.userName,
              password: Provider.of<Login>(context).password,
            );
          },
        ),
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
    log("IN MAINAPP BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProxyProvider"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${Provider.of<Employee>(context).empId}"),
          const SizedBox(
            height: 20,
          ),
          Text(Provider.of<Employee>(context).empName),
          const SizedBox(
            height: 20,
          ),
          Text(Provider.of<Login>(context).userName),
          const SizedBox(
            height: 20,
          ),
          Consumer<Login>(
            builder: (context, login, child) {
              log("IN CONSUMER");
              return Text(login.password);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<Login>(context, listen: false)
                  .changePassword("Kanha@2000");
            },
            child: const Text("Change Password"),
          )
        ],
      )),
    );
  }
}
