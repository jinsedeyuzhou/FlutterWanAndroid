import 'package:flutter_news/src/pages/history/read_history_controller.dart';
import 'package:get/get.dart';

class ReadHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadHistoryController>(
      () => ReadHistoryController(),
    );
  }
}
