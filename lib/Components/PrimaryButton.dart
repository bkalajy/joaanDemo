import 'package:flutter/material.dart';
import '../Resources/app_resources.dart';

class PrimaryButton extends StatefulWidget {
  final String txt;
  final Color color;
  final VoidCallback onPressed;

  PrimaryButton(
      {required this.txt, required this.color, required this.onPressed});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: widget.color,
          shadowColor: AppColors.white,
          minimumSize: const Size(double.infinity, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Center(
            child: Text(
          widget.txt,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontFamily: 'poppins',
            fontWeight: FontWeight.bold,
          ),
        )));
  }
}
