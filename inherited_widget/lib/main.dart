import 'package:flutter/material.dart';
import 'package:inherited_widget/changenotifierprovider.dart';
import 'package:inherited_widget/consumerr.dart';
import 'package:inherited_widget/inheritedwidget1.dart';
import 'package:inherited_widget/multiproviderr.dart';
import 'package:inherited_widget/providerr.dart';
import 'package:inherited_widget/proxyproviderr.dart';
import 'ephemeralstate.dart';
import 'inheritedwidget2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Inherit(),
      //home: MyApp1() ,
      // home: EphemeralDemo(),
      //home: MyProvider(),
      //home: MyNotifierProvider(),
      //home: MyMultiProvider(),
      //home: MyConsumer(),
      home: MyProxyProvider(),
    );
  }
}
