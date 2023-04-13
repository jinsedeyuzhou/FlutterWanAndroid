import 'dart:io';

import 'package:app_widget/app_widget.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'global_state.dart';

class AppTheme {
  static ThemeData darkTheme1({AppState? state}) => ThemeData(
        fontFamily: state?.fontFamily ?? "Roboto",
        brightness: Brightness.dark,
        primaryColor: AppColors.colorPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff222222),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff4699FB),
        ),
        dividerColor: Colors.grey,
        cupertinoOverrideTheme: const CupertinoThemeData(
          barBackgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: AppColors.colorPrimary,
        ),
        scaffoldBackgroundColor: Colors.black,
      );

  static ThemeData lightTheme1({AppState? state}) {
    SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light);

    return ThemeData(
      fontFamily: state?.fontFamily ?? "Roboto",
      useMaterial3: true,
      // colorSchemeSeed: Colors.blue[500],
      // Android 使用 Material3
      colorScheme: const ColorScheme.light().copyWith(
          primary: state?.themeColor ?? Colors.blue,
          background: AppColors.pageBackground),
      chipTheme:
          const ChipThemeData(padding: EdgeInsets.symmetric(horizontal: 10)
              // labelPadding: EdgeInsets.symmetric(horizontal: 6,vertical: 5)
              ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.colorPrimary,
        systemOverlayStyle: overlayStyle,
      ),
    );
  }

  static ThemeData darkTheme({AppState? state}) => FlexColorScheme.dark(
        scheme: FlexScheme.blue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        appBarStyle: FlexAppBarStyle.primary,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ).toTheme;

  static ThemeData lightTheme({AppState? state}) {
    SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light);

    return FlexColorScheme.light(
      scheme: FlexScheme.blue,
      appBarStyle: FlexAppBarStyle.primary,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useM2StyleDividerInM3: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    ).toTheme;
  }

  ///创建Material风格的color
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch as Map<int, Color>);
  }

  static final kThemeColorSupport = <MaterialColor, String>{
    Colors.red: "毁灭之红",
    Colors.orange: "愤怒之橙",
    Colors.yellow: "警告之黄",
    Colors.green: "伪装之绿",
    Colors.blue: "冷漠之蓝",
    Colors.indigo: "无限之靛",
    Colors.purple: "神秘之紫",
    const MaterialColor(0xff2D2D2D, <int, Color>{
      50: Color(0xFF8A8A8A),
      100: Color(0xFF747474),
      200: Color(0xFF616161),
      300: Color(0xFF484848),
      400: Color(0xFF3D3D3D),
      500: Color(0xff2D2D2D),
      600: Color(0xFF252525),
      700: Color(0xFF141414),
      800: Color(0xFF050505),
      900: Color(0xff000000),
    }): "归宿之黑"
  };
}
