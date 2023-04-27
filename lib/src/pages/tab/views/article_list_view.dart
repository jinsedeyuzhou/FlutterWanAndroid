import 'package:app_widget/app_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/src/pages/home/widget/item_article_list.dart';
import 'package:flutter_news/src/pages/tab/controllers/tab_article_controller.dart';
import 'package:get/get.dart';

import '../../../data/local/db/read_history.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/constant.dart';
import '../../../service/db_service.dart';

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
                  onTap: () {
                    var article = controller.tabListState.articles[index];
                    var parameters = <String, String>{
                      Constant.URL: article.link,
                      Constant.TITLE: article.title
                    };
                    DbService.to.insertReadHistory(ReadHistory.optional(
                        cid: article.chapterId,
                        link: article.link,
                        title: article.title));
                    Get.toNamed(Routes.WEB, parameters: parameters);
                  },
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
