import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../data/model/article_entity.dart';

class ArticleListState {
  RxList<ArticleEntity> articles = <ArticleEntity>[].obs;
}
