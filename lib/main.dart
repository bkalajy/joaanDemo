import 'package:flutter/material.dart';
import 'UI/phoneNumberScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhoneScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
