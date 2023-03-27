import 'package:flutter_news/src/pages/welcome/controllers/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
          () => WelcomeController(),
    );
  }
}
