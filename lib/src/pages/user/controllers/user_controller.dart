import 'package:flutter_arch/flutter_arch.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../service/auth_service.dart';

class UserController extends BaseController {
  void goLogin() {
    if (!AuthService.to.isLoggedInValue) {
      Get.toNamed(Routes.SIGN_IN);
    }
  }

  void goIntegral() {
    if (AuthService.to.isLoggedInValue) {
      ToastUtil.show(msg: '开发中');
    } else {
      Get.toNamed(Routes.SIGN_IN);
    }
  }

  void goCollect() {
    if (AuthService.to.isLoggedInValue) {
      ToastUtil.show(msg: '开发中');
    } else {
      Get.toNamed(Routes.SIGN_IN);
    }
  }

  void goBookmark() {
    if (AuthService.to.isLoggedInValue) {
      ToastUtil.show(msg: '开发中');
    } else {
      Get.toNamed(Routes.SIGN_IN);
    }
  }

  void goHistory() {
    Get.toNamed(Routes.READ_HISTORY);
  }

  void goSettings() {
    Get.toNamed(Routes.SETTINGS);
  }
}
