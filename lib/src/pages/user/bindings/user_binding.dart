import 'package:flutter_news/src/pages/user/controllers/user_controller.dart';
import 'package:get/get.dart';



class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
