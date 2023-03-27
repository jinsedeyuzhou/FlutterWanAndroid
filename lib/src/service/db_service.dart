import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DbService extends GetxService {
  /// 需要先Get.put,不然会报错
  static DbService get to => Get.find<DbService>();

  Future<DbService> init() async {
    if (kDebugMode) {
      print('$runtimeType delays 2 sec');
    }
    if (kDebugMode) {
      print('$runtimeType ready!');
    }
    return this;
  }
}
