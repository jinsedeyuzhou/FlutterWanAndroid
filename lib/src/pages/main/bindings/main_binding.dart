import 'package:flutter_news/src/pages/ask/controllers/ask_controller.dart';
import 'package:flutter_news/src/pages/system/controllers/system_controller.dart';
import 'package:flutter_news/src/pages/user/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_contoller.dart';
import '../../unknow/controllers/unknow_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<AskController>(
      () => AskController(),
    );
    Get.lazyPut<SystemController>(
      () => SystemController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
