import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arch/flavors/build_config.dart';
import 'package:flutter_arch/flavors/env_config.dart';
import 'package:flutter_arch/flavors/environment.dart';
import 'package:flutter_news/src/service/auth_service.dart';
import 'package:flutter_news/src/service/settings_service.dart';
import 'package:flutter_news/src/service/storage_service.dart';
import 'package:flutter_news/src/widget/loading_helper.dart';
import 'package:get/get.dart';

/// 全局 配置
class Global {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Future<void> init() async {
    // 环境配置
    EnvConfig devConfig = EnvConfig(
      appName: "玩安卓",
      baseUrl: "https://www.wanandroid.com",
      shouldCollectCrashLog: true,
    );
    BuildConfig.instantiate(
      envType: Environment.DEVELOPMENT,
      envConfig: devConfig,
    );
    //系统设置
    WidgetsFlutterBinding.ensureInitialized();
    GestureBinding.instance.resamplingEnabled = true;
    await Get.putAsync(
      () => StorageService().init(),
      tag: (StorageService).toString(),
    );
    // 设置配置
    await Get.putAsync(
      () => SettingsService().init(),
      tag: (SettingsService).toString(),
      permanent: true,
    );

    LoadingHelper();
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
