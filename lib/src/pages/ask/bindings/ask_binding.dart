import 'package:flutter_news/src/pages/ask/controllers/ask_controller.dart';
import 'package:get/get.dart';



class AskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskController>(
      () => AskController(),
    );
  }
}
