import 'package:flutter/material.dart';
import 'package:joaan_demo/Resources/app_resources.dart';
import 'package:joaan_demo/UI/dashboard.dart';
import 'package:joaan_demo/UI/mainScreen.dart';
import 'UI/phoneNumberScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
