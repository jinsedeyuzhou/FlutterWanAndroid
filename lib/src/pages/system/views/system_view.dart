import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/system/controllers/system_controller.dart';
import 'package:flutter_news/src/pages/system/views/custom_tab_bar_view.dart';
import 'package:get/get.dart';

class SystemView extends NBaseView<SystemController> {
  List<String> tags = [];

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => AnnotatedRegion(
          value: SystemUiOverlayStyle(
              statusBarBrightness:
                  controller.darkMode ? Brightness.light : Brightness.dark,
              statusBarIconBrightness:
                  controller.darkMode ? Brightness.dark : Brightness.light,
              statusBarColor: theme.primaryColor),
          sized: true,
          child: CustomTabBarView(),
        ));
  }
}
