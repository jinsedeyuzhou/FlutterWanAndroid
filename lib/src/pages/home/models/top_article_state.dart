import 'package:get/get.dart';

import '../../../data/model/article_entity.dart';

class TopArticleState{
  RxList<ArticleEntity> topArticles = <ArticleEntity>[].obs;
}