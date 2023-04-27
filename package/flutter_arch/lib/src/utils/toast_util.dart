import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// Toast 简单封装
///
class ToastUtil {
  static show({
    required String msg,
    Toast toastLength = Toast.LENGTH_SHORT,
    int timeInSecForIos = 1,
    double fontSize = 16.0,
    ToastGravity? gravity,
    Color backgroundColor = Colors.grey,
    Color textColor = Colors.white,
  }) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity??ToastGravity.CENTER,
        timeInSecForIosWeb: timeInSecForIos,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }
}
