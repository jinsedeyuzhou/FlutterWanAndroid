import 'package:app_widget/res/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controllers/bottom_nav_controller.dart';
import '../model/menu_code.dart';
import '../model/menu_item.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;

  BottomNavBar(
      {Key? key, required this.onNewMenuSelected, required this.navController})
      : super(key: key);
  late AppLocalizations appLocalization;

  BottomNavController navController;

  final Key bottomNavKey = GlobalKey();
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    appLocalization = AppLocalizations.of(context)!;
    theme = Theme.of(context);
    Color selectedItemColor = theme.primaryColor;
    Color unselectedItemColor = theme.primaryColorLight;
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => CupertinoTabBar(
        key: bottomNavKey,
        items: navItems
            .map(
              (BottomNavItem navItem) => BottomNavigationBarItem(
                  icon: Icon(navItem.icon),
                  // SvgPicture.asset(
                  //   "images/${navItem.iconSvgName}",
                  //   height: AppValues.iconDefaultSize,
                  //   width: AppValues.iconDefaultSize,
                  //   color:
                  //       navItems.indexOf(navItem) == navController.selectedIndex
                  //           ? selectedItemColor
                  //           : unselectedItemColor,
                  // ),
                  label: navItem.navTitle,
                  tooltip: ""),
            )
            .toList(),
        activeColor: selectedItemColor,
        inactiveColor: unselectedItemColor,
        currentIndex: navController.selectedIndex,
        iconSize: AppValues.iconSize_22,
        onTap: (index) {
          navController.updateSelectedIndex(index);
          onNewMenuSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavItem> _getNavItems() {
    return [
      BottomNavItem(
        navTitle: appLocalization.bottomNavHome,
        iconSvgName: "ic_home.svg",
        icon: Icons.home,
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
          navTitle: appLocalization.bottomNavAnswer,
          iconSvgName: "ic_favorite.svg",
          icon: Icons.messenger,
          menuCode: MenuCode.ASK),
      BottomNavItem(
          navTitle: appLocalization.bottomNavSystem,
          iconSvgName: "ic_settings.svg",
          icon: Icons.book,
          menuCode: MenuCode.SYSTEM),
      BottomNavItem(
          navTitle: appLocalization.bottomNavUser,
          iconSvgName: "ic_settings.svg",
          icon: Icons.person,
          menuCode: MenuCode.USER)
    ];
  }
}
