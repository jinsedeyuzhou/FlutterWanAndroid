import 'package:app_widget/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';
import 'button.dart';
import 'input.dart';

class SignUpView extends NBaseView<SignUpController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      toolbarHeight: 44,
      leading: IconButton(
        icon: const Icon(
          Ionicons.chevron_back,
          color: Colors.black87,
        ),
        onPressed: () {
          controller.handleNavPop();
        },
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
    );
  }

  @override
  Color pageBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget body(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height-44-ScreenUtil().statusBarHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              _buildInputForm(),
              const Spacer(),
              _buildThirdPartyLogin(),
              _buildHaveAccountButton(),
            ],
          ),
        ),
      ),
    );
  }

  // logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Text(
        appLocalization.signUp,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: 295.w,
      // height: 204.h,
      margin: EdgeInsets.only(top: 49.h),
      child: Column(
        children: [
          // fullName input
          inputTextEdit(
            controller: controller.fullnameController,
            keyboardType: TextInputType.text,
            hintText: appLocalization.fullName,
            marginTop: 0,
          ),
          // email input
          inputTextEdit(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: appLocalization.email,
          ),
          // password input
          inputTextEdit(
            controller: controller.passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: appLocalization.password,
            isPassword: true,
          ),

          // 创建
          Container(
            height: 44.h,
            margin: EdgeInsets.only(top: 15.h),
            child: btnFlatButtonWidget(
              onPressed: controller.handleSignUp,
              width: 295.w,
              fontWeight: FontWeight.w600,
              gbColor:theme.primaryColor,
              title: appLocalization.createAccount,
            ),
          ),
          // Spacer(),

          // Fogot password
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(
              onPressed: controller.handleFogotPassword,
              child: Text(
                appLocalization.forgetPassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 第三方
  Widget _buildThirdPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: <Widget>[
          // title
          Text(
            appLocalization.signDes,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: btnFlatButtonWidget(
        onPressed: controller.handleNavPop,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: appLocalization.havaAccount,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}
