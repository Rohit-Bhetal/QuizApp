import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final List<PopupMenuEntry> sideList;
  final Widget? icon;
  const SideMenu({super.key, required this.sideList, this.icon});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      itemBuilder: (context) => sideList,
      icon: icon,
    );
  }
}
