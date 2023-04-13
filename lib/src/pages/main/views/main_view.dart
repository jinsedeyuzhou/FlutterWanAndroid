import 'package:flutter/material.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/ask/views/ask_view.dart';
import 'package:flutter_news/src/pages/home/views/home_view.dart';
import 'package:flutter_news/src/pages/main/controllers/main_controller.dart';
import 'package:flutter_news/src/pages/main/views/bottom_nav_bar.dart';
import 'package:flutter_news/src/pages/user/views/user_view.dart';

import '../../../base/keep_alive_wrapper.dart';
import '../../system/views/system_view.dart';

// ignore: must_be_immutable
class MainView extends NBaseView<MainController> {
  MainView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: controller.navController.updateSelectedIndex,
      children: [
        KeepAliveWrapper(child: HomeView()),
        KeepAliveWrapper(child: AskView()),
        KeepAliveWrapper(child: SystemView()),
        KeepAliveWrapper(child: UserView()),
      ],
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(
      onNewMenuSelected: controller.onMenuSelected,
      navController: controller.navController,
    );
  }
}
