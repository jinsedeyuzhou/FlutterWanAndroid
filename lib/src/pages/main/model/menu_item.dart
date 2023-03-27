import 'package:flutter/cupertino.dart';

import 'menu_code.dart';

class BottomNavItem {
  final String navTitle;
  final String iconSvgName;
  final IconData icon;
  final MenuCode menuCode;

  const BottomNavItem(
      {required this.navTitle,
      required this.icon,
      required this.iconSvgName,
      required this.menuCode});
}
