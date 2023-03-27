import 'package:app_widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'global_state.dart';

class AppTheme {
  static ThemeData darkTheme({AppState? state}) => ThemeData(
      fontFamily: state?.fontFamily??"Roboto",
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: Colors.black,
        brightness: Brightness.light
      ),
      primaryColor: AppColors.colorPrimary,
      textTheme: const TextTheme(),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff222222)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: Color(0xff4699FB)),
      dividerColor: Colors.white,
      cupertinoOverrideTheme:
          const CupertinoThemeData(barBackgroundColor: Colors.black),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff181818),
          selectedItemColor: Color(0xff4699FB)),
      scaffoldBackgroundColor: const Color(0xff010201));

  static ThemeData lightTheme({AppState? state}) {
    return ThemeData(
        fontFamily: state?.fontFamily??"Roboto",
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            background: Colors.white,
            brightness: Brightness.dark
        ),
        primaryColor: AppColors.colorPrimary,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.colorWhite),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.white, backgroundColor: Colors.white),
        dividerColor: Colors.white,
        // switchTheme: SwitchThemeData(
        //     // trackColor: '',
        //     ),
        cupertinoOverrideTheme:
            const CupertinoThemeData(barBackgroundColor: AppColors.colorWhite),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            selectedItemColor: Color(0xff4699FB)),
        scaffoldBackgroundColor:Colors.white);
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
}
