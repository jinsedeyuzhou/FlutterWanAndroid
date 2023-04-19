import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/pages/tab/controllers/tab_list_controller.dart';
import 'package:flutter_news/src/pages/tab/views/article_list_view.dart';
import 'package:flutter_news/src/pages/tab/views/round_rect_rab_indicator.dart';
import 'package:get/get.dart';

class TabListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabListState();
}

class _TabListState extends State<TabListView>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<TabListController>();
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController =
        TabController(length: controller.tabList.length, vsync: this);

    return GetX(
      builder: (ctx) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
              statusBarBrightness:
                  controller.darkMode ? Brightness.light : Brightness.dark,
              statusBarIconBrightness:
                  controller.darkMode ? Brightness.dark : Brightness.light,
              statusBarColor: controller.theme.primaryColor),
          sized: true,
          child: Material(
            color: Colors.transparent,
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  toolbarHeight: 44,
                  title: Text(
                    controller.tabTitle,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  leading: InkWell(
                    onTap: controller.back,
                    child: const Icon(
                      Ionicons.chevron_back,
                      color: Colors.white,
                    ),
                  ),
                  bottom: TabBar(
                    onTap: (index) {

                    },
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicator: RoundRectTabIndicator(
                      borderSide: BorderSide(
                          color: controller.theme.primaryColor, width: 3),
                    ),
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                    controller: tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white60,
                    tabs: List.generate(
                      controller.tabList.length,
                      (index) => Tab(
                        text: controller.tabList[index].name,
                      ),
                    ),
                  ),
                ),
                body:  TabBarView(
                    controller: tabController,
                    children: controller.tabList
                        .map((e) => ArticleListView(
                              cid: e.id,
                            ))
                        .toList(),
                  ),
                )),
        );
      },
      init: controller,
    );
  }
}
