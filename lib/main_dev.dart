import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/my_app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "Flutter GetX WanAndroid  Dev",
    baseUrl: "https://www.wanandroid.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
// Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsControllers(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  //Framework异常
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  };

  // SettingsView.
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp(settingsController: settingsController));
  }, (error, stackTrace) {
    // APP 异常,同步和异步异常
    _reportError(error, stackTrace);
  }, zoneSpecification: ZoneSpecification(
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      // 记录所有的打印日志
      parent.print(zone, "line：$line");
      collectLog(line);
    },
  ));
}
// 上传日志
Future<void> _reportError(Object error, StackTrace stackTrace) async {
  if (kReleaseMode) {
    //release 上传
    LoggerUtil.instance().d("catch error=$error,stackTrace=$stackTrace");
    exit(1);
  } else {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return cusErrorWidget(error, stackTrace);
    };
  }
}

// 自定义错误页面
Widget cusErrorWidget(Object error, StackTrace stackTrace) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("出错了，请稍后重试"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(error.toString() + stackTrace.toString()),
            ),
            CupertinoButton(
                child: const Text("退出"),
                onPressed: () {
                  exit(1);
                })
          ],
        ),
      ),
    ),
  );
}

void collectLog(String line) {
  //收集日志
}
