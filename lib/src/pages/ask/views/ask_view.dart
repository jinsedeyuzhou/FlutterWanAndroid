import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/ask/controllers/ask_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widget/item_ask_list.dart';

class AskView extends NBaseView<AskController> {
  AskView({super.key});

  @override
  String? get tag => (AskController).toString();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: appLocalization.ask,
      // style:  const SystemUiOverlayStyle(
      //     statusBarColor: Colors.blue,
      //     statusBarBrightness: Brightness.light,
      //     statusBarIconBrightness: Brightness.light),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => MediaQuery.removePadding(
        removeTop: false,
        context: context,
        child: SmartRefresher(
          enablePullUp: true,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          controller: controller.refreshController,
          child: ListView.builder(
            controller: ScrollController(),
            itemBuilder: (context, index) {
              final article = controller.state.questionList[index];
              return ItemAskList(
                article: article,
                index: index,
              );
            },
            itemCount: controller.state.questionList.length,
          ),
        ),
      ),
    );
  }

  @override
  Widget showLoading() {
    return const Loading();
  }
}
