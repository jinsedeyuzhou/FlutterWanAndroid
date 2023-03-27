import 'dart:ui';

import 'package:app_data/app_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/sp_key.dart';

class SettingsService extends GetxService {
  /// 需要先Get.put,不然会报错
  static SettingsService get to =>
      Get.find<SettingsService>(tag: (SettingsService).toString());
  AppState appState = const AppState();
  ThemeMode _themeMode = ThemeMode.system;
  final ThemeData _themeData = AppTheme.darkTheme();

  final _locale = const Locale("zh", "CN").obs;

  Locale get locale => _locale.value;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;

  ThemeData get themeData => _themeData;


  late GetStorage box;

  Future<SettingsService> init() async {
    await GetStorage.init();
    box = GetStorage();
    if (kDebugMode) {
      print('$runtimeType ready!');
    }
    String languageType = box.read(StorageKey.languageType) ?? "zh_CN";
    print("languageType:${box.read(StorageKey.languageType)}");
    List list = languageType.split('_');
    if (list.length == 2) {
      _locale.value = Locale(list[0], list[1]);
      Get.updateLocale(locale);
    }
    print("themeModeIndex:${box.read(StorageKey.themeModeIndex)}");
    int themeModeIndex = box.read(StorageKey.themeModeIndex) ?? 0;
    _themeMode = ThemeMode.values[themeModeIndex];
    Get.changeThemeMode(themeMode);
    // if (themeModeIndex == 2) {
    //   _themeData = AppTheme.darkTheme(appState);
    // } else {
    //   _themeData = AppTheme.lightTheme(appState);
    // }
    print('$runtimeType end!');
    return this;
  }

  void changeThemeMode(ThemeMode mode) {
    print("$runtimeType ThemeMode:${mode.index}");

    /// 主题
    // Get.changeTheme(mode.index == 1
    //     ? AppTheme.darkTheme(appState)
    //     : AppTheme.lightTheme(appState));
    Get.changeThemeMode(mode);
    box.write(StorageKey.themeModeIndex, mode.index);
  }

  void changeLanguage(Locale locale) {
    /// 更新语言
    Get.updateLocale(locale);
    String languageType = "${locale.languageCode}_${locale.countryCode}";

    /// 存储本地语言配置
    box.write(StorageKey.languageType, languageType);
  }
}
