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
  ThemeMode _themeMode = ThemeMode.light;
  ThemeData _themeData = AppTheme.darkTheme();

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
      print('$runtimeType 初始化配置  ready!');
    }
    // 选择语言
    String languageType = box.read(StorageKey.languageType) ?? "zh_CN";
    print("languageType:${box.read(StorageKey.languageType)}");
    List list = languageType.split('_');
    if (list.length == 2) {
      _locale.value = Locale(list[0], list[1]);
      Get.updateLocale(locale);
    }
    // 切换ThemeMode
    print("themeModeIndex:${box.read(StorageKey.themeModeIndex)}");
    int themeModeIndex = box.read(StorageKey.themeModeIndex) ?? 0;
    _themeMode = ThemeMode.values[themeModeIndex];
    Get.changeThemeMode(themeMode);

    //切换主题
    int themeColorIndex = box.read(StorageKey.themeColorIndex) ?? 4;
    _themeData = AppTheme.lightTheme(
        state: AppState(
            themeColor:
                AppTheme.kThemeColorSupport.keys.toList()[themeColorIndex]));

    Get.changeTheme(_themeData);
    print('$runtimeType  初始化配置 end!');
    return this;
  }

  void changeTheme(MaterialColor materialColor) {
    int themeColorIndex =
        AppTheme.kThemeColorSupport.keys.toList().indexOf(materialColor);
    box.write(StorageKey.themeColorIndex, themeColorIndex);
    _themeData =
        AppTheme.lightTheme(state: AppState(themeColor: materialColor));
    Get.changeTheme(_themeData);
  }

  void changeThemeMode(ThemeMode mode) {
    print("$runtimeType ThemeMode:${mode.index}");

    /// 主题
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
