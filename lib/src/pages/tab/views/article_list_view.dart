import 'package:app_widget/app_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/src/pages/home/widget/item_article_list.dart';
import 'package:flutter_news/src/pages/tab/controllers/tab_article_controller.dart';
import 'package:get/get.dart';

class ArticleListView extends StatefulWidget {
  final int cid;

  ArticleListView({super.key, required this.cid}) {
    Get.put(TabArticleController(), tag: cid.toString());
  }

  @override
  State<StatefulWidget> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<TabArticleController>(tag: widget.cid.toString());
    controller.setCid(widget.cid);
    return GetX(
      initState: (_) => controller.onRefresh(),
      tag: widget.cid.toString(),
      builder: (controller) {
        return PagingView(
            onRefresh: controller.onRefresh,
            onLoadNextPage: controller.onLoad,
            children: [
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ItemArticleList(
                  index: index,
                  article: controller.tabListState.articles[index],
                ),
                itemCount: controller.tabListState.articles.length,
              ),
            ]);
      },
      init: controller,
    );
  }
}
