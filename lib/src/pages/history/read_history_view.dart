import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/history/item_history_view.dart';
import 'package:flutter_news/src/pages/history/read_history_controller.dart';
import 'package:flutter_news/src/widget/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReadHistoryView extends NBaseView<ReadHistoryController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      leading: InkWell(
        onTap: controller.back,
        child: const Icon(
          Ionicons.chevron_back,
          color: Colors.white,
        ),
      ),
      appBarTitleText: appLocalization.readHistory,
      isBackButtonEnabled: false,
      actions: [
        InkWell(
          onTap: controller.clearHistory,
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            child: Text(
              appLocalization.clearHistory,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => MediaQuery.removePadding(
        removeTop: false,
        context: context,
        child: controller.readHistoryState.readHistory.isEmpty
            ? const Center(
                child: Text("无数据"),
              )
            : SmartRefresher(
                enablePullUp: true,
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoading,
                controller: controller.refreshController,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final readHistory =
                        controller.readHistoryState.readHistory[index];
                    return ItemHistoryView(
                      history: readHistory,
                      index: index,
                    );
                  },
                  itemCount: controller.readHistoryState.readHistory.length,
                ),
              ),
      ),
    );
  }
}
