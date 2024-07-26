import 'package:flutter/material.dart';

class Inherit extends StatefulWidget {
  const Inherit({super.key});
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  String companyName = "Google";
  int empCount = 250;
  @override
  Widget build(BuildContext context) {
    return Company(
      companyName: companyName,
      empCount: empCount,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Inherited Company State"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ethe ek extra class ghyava lagto coz object creation complete honya adhich jr data magvaycha try kela tr null error yete , tyasathi dusra class lihun tyatun data magvla jato  
              const CompanyData(),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    companyName = "NVIDIA";
                    empCount++;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent),
                  child: const Text(
                    "Change Company",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                //child: const Text("Change Company"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyData extends StatelessWidget {
  const CompanyData({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        Company.of(context).companyName,
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(
        width: 20,
      ),
      Text("${Company.of(context).empCount}",
          style: const TextStyle(fontSize: 20))
    ]);
  }
}

class Company extends InheritedWidget {
  final String companyName;
  final int empCount;

  const Company(
      {super.key,
      required this.companyName,
      required this.empCount,
      required super.child});

  static Company of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Company>()!;
  }

// setState mule fkt nvin widget tree bnvun deto pn updateshouldNotify method mule element tree update hote
  @override

  //ethun true gel trch element tree update hote
  // ya method la call framework det
  bool updateShouldNotify(Company oldWidget) {
    return companyName != oldWidget.companyName ||
        empCount != oldWidget.empCount;
  }
}
