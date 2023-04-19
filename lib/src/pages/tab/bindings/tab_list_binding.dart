import 'package:flutter_news/src/pages/tab/controllers/tab_list_controller.dart';
import 'package:get/get.dart';

class TabListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabListController>(
      () => TabListController(),
    );
  }
}
