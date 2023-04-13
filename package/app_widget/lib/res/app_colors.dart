import 'package:flutter/material.dart';

abstract class AppColors {
  /// 页面背景颜色
  static const Color scaffoldBackground = Color(0xFFFFFFFF);

  /// 主要文本颜色
  static const Color primaryText = Color(0xFF333333);

  /// 次要文本颜色
  static const Color secondaryText = Color(0xFF74788D);

  /// 高亮颜色
  static const Color accentColor = Color(0xFF5C78FF);

  /// 次要颜色
  static const Color secondaryColor = Color(0xFFDEE3FF);

  /// 警告颜色
  static const Color warnColor = Color(0xFFFFB822);

  /// 边框颜色
  static const Color borderColor = Color(0xFFDEE3FF);

  static const Color pinkColor = Color(0xFFF77866);

  static const Color yellowColor = Color(0xFFFFB822);

  /// 主背景 白色
  static const Color primaryBackground = Color.fromARGB(255, 255, 255, 255);

  /// 主文本 灰色
  // static const Color primaryText = Color.fromARGB(255, 45, 45, 47);

  /// 主控件-背景 蓝色
  static const Color primaryElement = Color.fromARGB(255, 41, 103, 255);

  /// 主控件-文本 白色
  static const Color primaryElementText = Color.fromARGB(255, 255, 255, 255);

  // *****************************************

  /// 第二种控件-背景色 淡灰色
  static const Color secondaryElement = Color.fromARGB(255, 246, 246, 246);

  /// 第二种控件-文本 浅蓝色
  static const Color secondaryElementText = Color.fromARGB(255, 41, 103, 255);

  // *****************************************

  /// 第三种控件-背景色 石墨色
  static const Color thirdElement = Color.fromARGB(255, 45, 45, 47);

  /// 第三种控件-文本 浅灰色2
  static const Color thirdElementText = Color.fromARGB(255, 141, 141, 142);

  // *****************************************

  /// tabBar 默认颜色 灰色
  static const Color tabBarElement = Color.fromARGB(255, 208, 208, 208);

  /// tabCellSeparator 单元格底部分隔条 颜色
  static const Color tabCellSeparator = Color.fromARGB(255, 230, 230, 231);

  static const Color pageBackground =Color(0xFFf4f4f4);
  static const Color statusBarColor = Colors.blue;
  static const Color appBarColor = Colors.blue;
  static const Color appBarBackground = Color(0xFF34A2DA);
  static const Color appBarIconColor =textColorPrimary;
  static const Color appBarTextColor =textColorPrimary;

  static const Color centerTextColor = Color(0xFF666666);
  static const MaterialColor colorPrimarySwatch = Colors.blue;
  static const Color colorPrimary = Colors.blue;
  static const Color colorAccent = Colors.blueAccent;
  static const Color colorLightGreen = Colors.lightBlue;
  static const Color colorWhite = Colors.white;
  static const Color lightGreyColor = Colors.grey;
  static const Color errorColor = Color(0xFFAB0B0B);
  static const Color colorDark = Color(0xFF323232);

  static const Color buttonBgColor = colorPrimary;
  static const Color disabledButtonBgColor = Color(0xFFBFBFC0);
  static const Color defaultRippleColor = Color(0x0338686A);

  static const Color textColorPrimary = Color(0xFF333333);
  static const Color textColorSecondary = Color(0xFF9FA4B0);
  static const Color textColorTag = colorPrimary;
  static const Color textColorGreyLight = Color(0xFFABABAB);
  static const Color textColorGreyDark = Color(0xFF979797);
  static const Color textColorBlueGreyDark = Color(0xFF939699);
  static const Color textColorCyan = Colors.blue;
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static Color searchFieldTextColor = const Color(0xFF323232).withOpacity(0.5);

  static const Color iconColorDefault = Colors.grey;

  static Color barrierColor = const Color(0xFF000000).withOpacity(0.5);

  static Color timelineDividerColor = const Color(0x5438686A);

  static const Color gradientStartColor = Colors.black87;
  static const Color gradientEndColor = Colors.transparent;
  static const Color silverAppBarOverlayColor = Color(0x80323232);

  static const Color switchActiveColor = colorPrimary;
  static const Color switchInactiveColor = Color(0xFFABABAB);
  static Color elevatedContainerColorOpacity = Colors.grey.withOpacity(0.5);
  static const Color suffixImageColor = Colors.grey;
}
