import 'package:flutter/cupertino.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/model/user.dart';
import '../models/sign_up_state.dart';
import '../views/security.dart';

class SignUpController extends BaseController
{
  SignUpController();

  /// obs 响应式变量 才写入 state
  final state = SignUpState();

  /// 业务变量

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  /// 业务事件

  // 返回上一页
  handleNavPop() {
    Get.back();
  }

  // 提示信息
  handleTip() {
    ToastUtil.show(msg: '这是注册界面');
  }

  // 忘记密码
  handleFogotPassword() {
    ToastUtil.show(msg: '忘记密码');
  }

  // 执行注册操作
  handleSignUp() async {
    // if (!duCheckStringLength(fullnameController.value.text, 5)) {
    //   toastInfo(msg: '用户名不能小于5位');
    //   return;
    // }
    // if (!duIsEmail(emailController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(passController.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }

    UserRegisterRequestEntity params = UserRegisterRequestEntity(
      email: emailController.value.text,
      password: duSHA256(passController.value.text),
    );

    // await UserAPI.register(
    //   params: params,
    // );

    Get.back();
  }

  /// 生命周期

  // 页面载入完成
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}