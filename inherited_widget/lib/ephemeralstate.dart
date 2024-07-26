import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class EphemeralDemo extends StatefulWidget {
  const EphemeralDemo({super.key});

  @override
  State createState() => _EphemeralDemoState();
}

class _EphemeralDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("SetState management"),
          centerTitle: true,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Course(courseName: "Java"),
            SizedBox(
              height: 50,
            ),
            Course(courseName: "Flutter"),
          ],
        ));
  }
}

class Course extends StatefulWidget {
  final String courseName;
  const Course({super.key, required this.courseName});

  @override
  State createState() => _CourseState();
}

class _CourseState extends State<Course> {
  int referencecount = 0;
  @override
  Widget build(BuildContext context) {
    log("In Course build");
    log(widget.courseName);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              referencecount++;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(widget.courseName, style: TextStyle(fontSize: 20)),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          alignment: Alignment.center,
          height: 70,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.purple.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text("$referencecount", style: TextStyle(fontSize: 20)),
        )
      ],
    );
  }
}
