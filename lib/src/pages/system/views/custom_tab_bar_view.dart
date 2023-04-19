import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/pages/system/controllers/system_controller.dart';
import 'package:flutter_news/src/pages/system/views/system_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTabBarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBarView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<String> tags = [];

  @override
  bool get wantKeepAlive => true;

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    tags = [
      AppLocalizations.of(Get.context!)!.system,
      AppLocalizations.of(Get.context!)!.navigation
    ];
    _tabController = TabController(length: tags.length, vsync: this);

    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
          height: 48 + ScreenUtil().statusBarHeight,
          child: Center(
            child: _buildTabBar(tags),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _buildTabBarView(context),
          ),
        ),
      ],
    );
  }

  _buildTabBar(List<String> tabs) {
    return TabBar(
      tabs: tags
          .map((e) => Tab(
                text: e,
              ))
          .toList(),
      onTap: (tab) => {},
      labelColor: Colors.white,
      labelStyle: pageMainTitleStyle,
      unselectedLabelStyle: const TextStyle(fontSize: 16),
      unselectedLabelColor: const Color(0x88ffffff),
      isScrollable: true,
      controller: _tabController,
      indicator: const BoxDecoration(),
    );
  }

  _buildTabBarView(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: false,
      context: context,
      child: TabBarView(controller: _tabController, children: [
        SystemListView(),
        NavigationListView(),
      ]),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
