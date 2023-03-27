import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/routes/sp_key.dart';
import 'package:flutter_news/src/service/storage_service.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class WelcomeController extends BaseController {
  final _obj = ''.obs;

  set obj(value) => this._obj.value = value;

  get obj => this._obj.value;

  // 跳转 注册界面
  handleNavSignIn() async {
    await StorageService.to.setBool(SpKey.isFirstOpen, true);
    Get.offAndToNamed(Routes.MAIN);
  }
}
