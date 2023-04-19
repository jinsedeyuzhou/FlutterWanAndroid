import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/my_app.dart';
import 'global.dart';

void main() async {
  //Framework异常
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  };
  await Global.init();
  runApp(const MyApp());
  // SettingsView.
  // runZonedGuarded(() {
  //   runApp(const MyApp());
  // }, (error, stackTrace) {
  //   // APP 异常,同步和异步异常
  //   _reportError(error, stackTrace);
  // }, zoneSpecification: ZoneSpecification(
  //   print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
  //     // 记录所有的打印日志
  //     parent.print(zone, "line：$line");
  //     collectLog(line);
  //   },
  // ));
}

// 上传日志
Future<void> _reportError(Object error, StackTrace stackTrace) async {
  if (kReleaseMode) {
    //release 上传
    LoggerUtil.instance().d("catch error=$error,stackTrace=$stackTrace");
    exit(1);
  } else {
    LoggerUtil.instance().d("catch error=$error,stackTrace=$stackTrace");
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
