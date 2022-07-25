import 'package:flutter/material.dart';

class CusTextButton extends StatefulWidget {
  final String txt;
  final Color color;
  final double size;

  CusTextButton({required this.txt, required this.color, required this.size});

  @override
  _CusTextButtonState createState() => _CusTextButtonState();
}

class _CusTextButtonState extends State<CusTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(primary: widget.color),
        child: Text(
          widget.txt,
          style: TextStyle(
            color: widget.color,
            decoration: TextDecoration.underline,
            fontSize: widget.size,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
