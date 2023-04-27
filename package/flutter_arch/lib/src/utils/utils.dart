import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Create by wyy
/// 工具类

/// model格式化，
typedef ModelBuilder<T> = T Function(dynamic value);

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  /// 复制文字到剪切板
  static void copyData(String string) {
    ClipboardData data = new ClipboardData(text: string);
    Clipboard.setData(data);
  }

  /// 回收键盘
  static hideKeybaord(BuildContext context) {
    // 触摸收起键盘
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// 是否暗黑模式
  static bool isWindowDart() {
    Brightness xfsBrightness = window.platformBrightness;
    return xfsBrightness == Brightness.dark;
  }

  /// iOSstring转bool
  static bool iOSNSStringToBool(dynamic data) {
    if (data is String && Platform.isIOS) {
      return data == '0' ? false : true;
    } else if (data is bool) {
      return data;
    }
    return false;
  }


}
