import 'package:flutter_news/src/pages/login/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
          () => SignUpController(),
    );
  }

}