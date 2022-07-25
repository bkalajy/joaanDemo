import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Resources/app_resources.dart';

class CusBottomNavigation extends StatefulWidget {
  final Color selectedItem;
  final Color disabledItem;
  final List<BottomNavigationBarItem> items;
  const CusBottomNavigation(
      {Key? key,
      required this.selectedItem,
      required this.disabledItem,
      required this.items})
      : super(key: key);

  @override
  State<CusBottomNavigation> createState() => _CusBottomNavigationState();
}

class _CusBottomNavigationState extends State<CusBottomNavigation> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.items.length - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.iron,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        iconSize: 25,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: widget.selectedItem,
        unselectedItemColor: widget.disabledItem,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: widget.items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
