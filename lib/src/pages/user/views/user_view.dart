import 'package:app_data/app_data.dart';
import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/user/controllers/user_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/src/pages/user/views/user_item_view.dart';
import 'package:flutter_news/src/service/settings_service.dart';
import 'package:get/get.dart';

class UserView extends NBaseView<UserController> {
  bool _isChinese = (Get.locale?.countryCode == "CN");

  UserView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    print("$runtimeType user");
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          InkWell(
            onTap: controller.goLogin,
            child: Container(
              color: theme.primaryColor,
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ClipOval(
                    child: Icon(
                      Ionicons.person_circle,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: controller.goLogin,
                      child: Text(
                        appLocalization.viewStateMessageUnAuth,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ],
              ),
            ),
          ),
          UserItemView(
              prefixImage: Feather.award,
              suffixImage: MaterialIcons.keyboard_arrow_right,
              title: appLocalization.mineIntegral,
              onTap: controller.goIntegral),
          UserItemView(
              prefixImage: FontAwesome.bookmark_o,
              suffixImage: MaterialIcons.keyboard_arrow_right,
              title: appLocalization.mineBookmark,
              onTap: controller.goBookmark),
          UserItemView(
              prefixImage: Icons.favorite_border,
              suffixImage: MaterialIcons.keyboard_arrow_right,
              title: appLocalization.mineCollect,
              onTap: controller.goCollect),
          UserItemView(
              prefixImage: MaterialIcons.history,
              suffixImage: MaterialIcons.keyboard_arrow_right,
              title: appLocalization.readHistory,
              onTap: controller.goHistory),
          UserItemView(
              prefixImage: AntDesign.setting,
              suffixImage: MaterialIcons.keyboard_arrow_right,
              title: appLocalization.systemSettings,
              onTap: controller.goSettings),
        ],
      ),
    );
  }
}
