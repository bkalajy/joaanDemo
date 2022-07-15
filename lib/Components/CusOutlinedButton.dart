import 'package:flutter/material.dart';
import '../Resources/app_resources.dart';

class CusOutlinedButton extends StatefulWidget {
  final String txt;
  final Color color;
  final double height;
  final double width;

  CusOutlinedButton(
      {required this.txt,
      required this.color,
      required this.height,
      required this.width});

  @override
  _CusOutlinedButtonState createState() => _CusOutlinedButtonState();
}

class _CusOutlinedButtonState extends State<CusOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            primary: widget.color,
            //shadowColor: AppColors.white,
            side: BorderSide(width: 2.0, color: AppColors.scarlet),
          ),
          child: Center(
              child: Text(
            widget.txt,
            style: TextStyle(
              color: widget.color,
              fontSize: 16,
              fontFamily: 'poppins',
              fontWeight: FontWeight.normal,
            ),
          ))),
    );
  }
}
