import 'package:flutter_news/src/pages/search/models/hotkey_entity.dart';
import 'package:get/get.dart';

import '../../../data/model/article_entity.dart';

class SearchListState {
  RxList<ArticleEntity> searchList = <ArticleEntity>[].obs;
  RxList<HotkeyEntity> hotkeyList = <HotkeyEntity>[].obs;
}
