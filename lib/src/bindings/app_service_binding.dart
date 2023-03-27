import 'package:flutter/foundation.dart';
import 'package:flutter_news/src/service/auth_service.dart';
import 'package:flutter_news/src/service/storage_service.dart';
import 'package:get/get.dart';
import '../service/db_service.dart';
import '../service/settings_service.dart';

class AppServiceBindings extends Bindings {
  @override
  void dependencies() {
    if (kDebugMode) {
      print('starting services ...');
    }
    Get.putAsync(
      () => DbService().init(),
      tag: (DbService).toString(),
    ); //API
    Get.put(AuthService());
    if (kDebugMode) {
      print('All services started...');
    }
  }
}
