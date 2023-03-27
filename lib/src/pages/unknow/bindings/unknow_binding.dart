import 'package:get/get.dart';

import '../controllers/unknow_controller.dart';


class UnknowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnknowController>(
      () => UnknowController(),
    );
  }
}
