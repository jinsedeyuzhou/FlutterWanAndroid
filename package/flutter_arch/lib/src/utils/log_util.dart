import 'dart:io';

import 'package:flutter/foundation.dart';

import 'object_utils.dart';

/// 打印工具


class LogUtil{

  static LogUtil? _instance;
  static String? _projectName;
  static int maxLeng = 300;
  static String? _fileName;
  static String? _lineNumber;
  static bool _isRelease = kReleaseMode;

  LogUtil._();

  static LogUtil? instance({required bool isRelease, String? projectName,}){
    if(_instance == null){
      _instance = LogUtil._();
      _projectName = projectName;
      _isRelease = isRelease;
    }
    return _instance;
  }

  static warning(Object printObj, {StackTrace? stackTrace, String? funcName}){
    _print(printObj, title: "⚠️", stackTrace: stackTrace, funcName: funcName);
  }

  static error(Object printObj, {StackTrace? stackTrace, String? funcName}){
    _print(printObj, title: "❌", stackTrace: stackTrace, funcName: funcName);
  }

  static success(Object printObj, {StackTrace? stackTrace, String? funcName}){
    _print(printObj, title: "✅️", stackTrace: stackTrace, funcName: funcName);
  }

  static info(Object printObj, {StackTrace? stackTrace, String? funcName}){
    _print(printObj, title: "🌟", stackTrace: stackTrace, funcName: funcName);
  }

  static _print(Object printObj, {StackTrace? stackTrace, String? title, String? funcName}){
    if(!_isRelease){
      _parseTrace(stackTrace);

      String objStr = printObj.toString();
      if (!Platform.isIOS){
        if(objStr.length > maxLeng){
          while(objStr.length > maxLeng){
            debugPrint(objStr.substring(0, maxLeng));
            objStr = objStr.substring(maxLeng);
          }
        }
      }
      debugPrint("${_projectName??"「flutter」"} $title 「${DateTime.now()}」${_fileName==null?"":" $title 文件：「$_fileName」"}${funcName==null?"":" $title 函数：「$funcName」"}${_lineNumber == null?"":" $title 行数：$_lineNumber"} : $objStr");
      // debugPrint(objStr);
    }
  }

  static _parseTrace(StackTrace? trace){
    if(trace != null){
      List<String> traceList = trace.toString().split("\n");
      if(ObjectUtil.isNotEmpty(trace)){
        var traceString = traceList[0];
        var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z]+.dart'));
        var fileInfo = traceString.substring(indexOfFileName);
        var listOfInfos = fileInfo.split(":");
        if(listOfInfos.length >= 2){
          _fileName = listOfInfos[0];
          _lineNumber = listOfInfos[1];
        }else if(listOfInfos.length == 1){
          _fileName = listOfInfos[0];
        }
      }
    }
  }

}