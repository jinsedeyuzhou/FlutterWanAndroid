import 'package:flutter_news/src/pages/home/controllers/home_contoller.dart';
import 'package:get/get.dart';

import '../controllers/system_controller.dart';



class SystemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SystemController>(
      () => SystemController(),
    );
  }
}
