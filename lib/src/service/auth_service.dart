import 'package:flutter_news/src/service/storage_service.dart';
import 'package:get/get.dart';

import '../routes/sp_key.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find<AuthService>();

  /// Mocks a login process
  final isLoggedIn = false.obs;

  bool get isLoggedInValue => isLoggedIn.value;

  // 令牌 token
  String token = '';

  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    token = StorageService.to.getString(SpKey.token);
    super.onInit();
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(SpKey.token, value);
    token = value;
  }

  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
