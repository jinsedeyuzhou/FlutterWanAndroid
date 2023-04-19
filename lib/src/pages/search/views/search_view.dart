import 'package:app_widget/res/app_colors.dart';
import 'package:app_widget/res/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/pages/home/widget/item_article_list.dart';
import 'package:flutter_news/src/pages/search/controllers/search_controller.dart';
import 'package:flutter_news/src/pages/search/views/item_search_article.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/news_base_widget_mixin.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/constant.dart';
import 'app_search_bar.dart';

class SearchView extends NBaseView<SearchController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => Column(
          children: [
            AppSearchBar(),
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: controller.inputText.isNotEmpty
                      ? SearchResultView()
                      : SearchTagView(),
                )),
          ],
        ));
  }
}

class SearchTagView extends StatelessWidget with NBaseWidgetMixin {
  final controller = Get.find<SearchController>();

  @override
  Widget body(BuildContext context) {
    return GetX(
      builder: (ctr) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.searchListState.hotkeyList.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(
                  top: AppValues.margin,
                  left: AppValues.margin,
                ),
                child: Text(
                  appLocalization.hotkey,
                  style: TextStyle(color: theme.primaryColor, fontSize: 16),
                ),
              ),
            if (controller.searchListState.hotkeyList.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(
                    left: AppValues.margin, right: AppValues.margin),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 6,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: controller.searchListState.hotkeyList
                      .map((e) => MaterialButton(
                            onPressed: () {
                              controller.textEditingController.text = e.name;
                              controller.searchList(seachKey: e.name);
                            },
                            height: 34,
                            elevation: 0,
                            padding: const EdgeInsets.only(
                                left: AppValues.margin,
                                right: AppValues.margin),
                            color: const Color(0xfff5f5f5),
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                  color: AppColors.textColorPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ))
                      .toList(),
                ),
              ),
            if (controller.searchHistorys.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(
                  left: AppValues.margin,
                ),
                child: Text(
                  appLocalization.hotkey,
                  style: TextStyle(color: theme.primaryColor, fontSize: 16),
                ),
              ),
            if (controller.searchHistorys.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(
                    left: AppValues.margin, right: AppValues.margin),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 6,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: controller.searchHistorys
                      .map((e) => MaterialButton(
                            onPressed: () {
                              controller.textEditingController.text = e;
                            },
                            height: 34,
                            elevation: 0,
                            padding: const EdgeInsets.only(
                                left: AppValues.margin,
                                right: AppValues.margin),
                            color: const Color(0xfff5f5f5),
                            child: Text(
                              e,
                              style: const TextStyle(
                                  color: AppColors.textColorPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ))
                      .toList(),
                ),
              ),
          ],
        );
      },
      init: controller,
    );
  }
}

class SearchResultView extends StatelessWidget with NBaseWidgetMixin {
  final controller = Get.find<SearchController>();

  @override
  Widget body(BuildContext context) {
    return GetX(
      builder: (ctx) {
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.refresh,
          onLoading: controller.loadMore,
          enablePullUp: true,
          child: ListView.builder(
            itemCount: controller.searchListState.searchList.length,
            itemBuilder: (context, index) {
              ArticleEntity articleEntity =
                  controller.searchListState.searchList[index];
              return ItemSearchArticle(
                article: articleEntity,
                index: index,
                onTap: () async {
                  var parameters = <String, String>{
                    Constant.URL: articleEntity.link,
                    Constant.TITLE: articleEntity.title
                  };
                  Get.toNamed(Routes.WEB, parameters: parameters);
                },
              );
            },
          ),
        );
      },
      init: controller,
    );
  }
}
