import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_news/src/routes/sp_key.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  /// 需要先Get.put,不然会报错
  static StorageService get to => Get.find<StorageService>(tag: (StorageService).toString());

  /// 内部插件单例初始化
  late final SharedPreferences _spInstance;
  bool isInitFinished = false;

  bool isFirstOpen = false;

  /// 具体的初始化方法
  Future<StorageService> init() async {
    if (!isInitFinished) {
      _spInstance = await SharedPreferences.getInstance();
      isInitFinished = true;
      isFirstOpen = getBool(SpKey.isFirstOpen);
      print("$runtimeType 初始化完成${isFirstOpen}");
    }
    print("$runtimeType 初始化完成");
    return this;
  }

  @override
  void onInit() {
    super.onInit();
  }

  /// 检查初始化化过程是否完成，不然会报错
  bool checkInitial() {
    if (!isInitFinished) {
      EasyLoading.showError('初始化未完成');
      return false;
    }
    return true;
  }

  Future<bool> setInt(String key, int value) async {
    if (!checkInitial()) {
      return false;
    }
    return await _spInstance.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    if (!checkInitial()) {
      return false;
    }
    return await _spInstance.setDouble(key, value);
  }

  Future<bool> setString(String key, String value) async {
    if (!checkInitial()) {
      return false;
    }
    return await _spInstance.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    if (!checkInitial()) {
      return false;
    }
    return await _spInstance.setBool(key, value);
  }

  int getInt(String key) {
    if (!checkInitial()) {
      return 0;
    }
    return _spInstance.getInt(key) ?? 0;
  }

  double getDouble(String key) {
    if (!checkInitial()) {
      return 0.0;
    }
    return _spInstance.getDouble(key) ?? 0.0;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    if (!checkInitial()) {
      return false;
    }
    return await _spInstance.setStringList(key, value);
  }

  String getString(String key) {
    if (!checkInitial()) {
      return '';
    }
    return _spInstance.getString(key) ?? '';
  }

  bool getBool(String key) {
    if (!checkInitial()) {
      return false;
    }
    return _spInstance.getBool(key) ?? false;
  }

  List<String> getStringList(String key) {
    if (!checkInitial()) {
      return [];
    }
    return _spInstance.getStringList(key) ?? [];
  }

  bool containsKey(String key) {
    if (!checkInitial()) {
      return false;
    }
    return _spInstance.containsKey(key);
  }

  Future<bool> remove(String key) async {
    if (!checkInitial()) {
      return false;
    }
    return await _spInstance.remove(key);
  }

  Future<bool> clear() async {
    if (!checkInitial()) {
      return false;
    }
    return await _spInstance.clear();
  }

  /// 保存为json字符串
  Future<bool> setObject(String key, Object object) async {
    if (!checkInitial()) {
      return false;
    }
    String jsonString = '';
    bool result = false;
    try {
      jsonString = json.encode(object);
      result = await _spInstance.setString(key, jsonString);
    } catch (e) {
      // EasyLoading.showError(e.toString());
    }
    return result;
  }

  /// 读取json字符串
  Object getObject(String key) {
    if (!checkInitial()) {
      return '';
    }
    String jsonString = _spInstance.getString(key) ?? '';
    Object object = {};
    if (jsonString.isNotEmpty) {
      try {
        object = json.decode(jsonString) ?? {};
      } catch (e) {
        // EasyLoading.showError(e.toString());
      }
    }
    return object;
  }
}
