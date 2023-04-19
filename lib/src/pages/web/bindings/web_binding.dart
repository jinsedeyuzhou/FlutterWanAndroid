import 'package:flutter_news/src/pages/web/controllers/web_controller.dart';
import 'package:get/get.dart';

class WebBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<WebController>(
          () => WebController(),
    );
  }

}