import 'package:app_widget/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/pages/home/widget/article_tag.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/news_base_widget_mixin.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/constant.dart';
import '../../home/widget/animated_provider.dart';

class ItemAskList extends StatelessWidget with NBaseWidgetMixin {
  final ArticleEntity article;
  final int index;

  /// 首页置顶
  final bool top;

  /// 隐藏收藏按钮
  final bool hideFavourite;

  final GestureTapCallback? onTap;

  ItemAskList(
      {Key? key,
      this.onTap,
      this.top = false,
      this.hideFavourite = false,
      required this.article,
      required this.index})
      : super(key: key);

  @override
  Widget body(BuildContext context) {
    /// 用于Hero动画的标记
    UniqueKey uniqueKey = UniqueKey();
    return Stack(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap ??
                () async{
                  //TODO 详情
                  var parameters = <String, String>{
                    Constant.URL: article.link,
                    Constant.TITLE: article.title
                  };
                  Get.toNamed(Routes.WEB, parameters: parameters);
                },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              // decoration: BoxDecoration(
              //     border: Border(
              //       bottom: Divider.createBorderSide(context, width: 0.5,color: AppColors.lightGreyColor),
              //     )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                          article.author.isNotEmpty
                              ? article.author
                              : article.shareUser ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      if (article.fresh)
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: ArticleTag(
                            appLocalization.newArticle,
                            color: theme.primaryColor,
                          ),
                        ),
                      if (article.tags.isNotEmpty)
                        Row(
                          children: article.tags
                              .map((e) => ArticleTag(
                                    e.name,
                                    color: theme.primaryColor,
                                  ))
                              .toList(),
                        ),
                      const Expanded(
                        child: SizedBox.shrink(),
                      ),
                      Text(article.niceDate,
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 7),
                    child: AskTitleWidget(article.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: AskDesWidget(article.desc),
                  ),
                  Row(
                    children: <Widget>[
                      if (top)
                        ArticleTag(
                          appLocalization.topArticle,
                          color: Colors.redAccent,
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          (article.superChapterName.isNotEmpty
                                  ? '${article.superChapterName} · '
                                  : '') +
                              (article.chapterName ?? ''),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: (hideFavourite
              ? const SizedBox.shrink()
              : ArticleFavouriteWidget(
                  collect: article.collect,
                  onCollect: (collect) {},
                  uniqueKey: uniqueKey,
                )),
        ),
      ],
    );
  }
}

class AskDesWidget extends StatelessWidget {
  final String des;

  AskDesWidget(this.des, {super.key});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: des,
    );
  }
}

class AskTitleWidget extends StatelessWidget {
  final String title;

  AskTitleWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    var html = HtmlUnescape();
    return Text(
      html.convert(title),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// 收藏按钮
class ArticleFavouriteWidget extends StatelessWidget {
  bool collect;
  final Function(bool)? onCollect;
  final UniqueKey uniqueKey;

  ArticleFavouriteWidget(
      {required this.collect, this.onCollect, required this.uniqueKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque, //否则padding的区域点击无效
        onTap: () {
          if (onCollect != null) {
            collect = !collect;
            onCollect!(collect);
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Hero(
              tag: uniqueKey,
              child: ScaleAnimatedSwitcher(
                child: Icon(collect ? Icons.favorite : Icons.favorite_border,
                    color: Colors.redAccent[100]),
              )),
        ));
  }
}
