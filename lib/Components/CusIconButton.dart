import 'package:flutter/material.dart';

class CusIconButton extends StatefulWidget {
  final IconData? icon;
  final String iconPath;
  final Color primary;
  final Color secondary;
  final double size;

  CusIconButton(
      {required this.primary,
      required this.secondary,
      required this.size,
      this.iconPath = '',
      this.icon});

  @override
  _CusIconButtonState createState() => _CusIconButtonState();
}

class _CusIconButtonState extends State<CusIconButton> {
  late Color currentColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentColor = widget.primary;
  }

  @override
  Widget build(BuildContext context) {
    dynamic icon = (widget.icon == null)
        ? ImageIcon(AssetImage(widget.iconPath))
        : widget.icon;

    return ListTile(
      leading: IconButton(
        splashRadius: 1,
        iconSize: widget.size,
        icon: Icon(icon),
        color: currentColor,
        onPressed: () {
          setState(() {
            if (currentColor == widget.primary) {
              currentColor = widget.secondary;
            } else {
              currentColor = widget.primary;
            }
          });
        },
      ),
    );
  }
}
