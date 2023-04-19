import 'package:flutter/cupertino.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/routes/app_pages.dart';
import 'package:flutter_news/src/service/auth_service.dart';
import 'package:get/get.dart';

import '../../../data/model/user.dart';
import '../../../utils/validator.dart';
import '../models/state.dart';
import '../views/security.dart';

class SignInController extends BaseController {
  final state = SignInState();

  SignInController();

  // email的控制器
  final TextEditingController emailController = TextEditingController();

  // 密码的控制器
  final TextEditingController passController = TextEditingController();

  // final MyRepository repository;
  // SignInController({@required this.repository}) : assert(repository != null);

  // 跳转 注册界面
  handleNavSignUp() {
    Get.toNamed(Routes.SIGN_UP);
  }

  // 忘记密码
  handleFogotPassword() {
    ToastUtil.show(msg: '忘记密码');
  }

  // 执行登录操作
  handleSignIn() async {
    if (!duIsEmail(emailController.value.text)) {
      ToastUtil.show(msg: '请正确输入邮件');
      return;
    }
    if (!duCheckStringLength(passController.value.text, 6)) {
      ToastUtil.show(msg: '密码不能小于6位');
      return;
    }
    AuthService.to.login();
    // UserLoginRequestEntity params = UserLoginRequestEntity(
    //   email: emailController.value.text,
    //   password: duSHA256(passController.value.text),
    // );

    // UserLoginResponseEntity userProfile = await UserAPI.login(
    //   params: params,
    // );
    // UserStore.to.saveProfile(userProfile);

    Get.offAllNamed(Routes.MAIN);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
