import 'package:flutter_news/src/data/get_connect/ask_provider.dart';

import '../model/article_entity.dart';
import '../model/base_response_list.dart';

abstract class IAskRepository {
  Future< BaseListResponse<ArticleEntity>?> getQuestionList( {int pageIndex = 1});
}

class AskRepository implements IAskRepository {
  AskRepository({required this.provider});

  final IAskProvider provider;

  @override
  Future< BaseListResponse<ArticleEntity>?> getQuestionList(
      {int pageIndex = 1}) async {
    final response = await provider.getQuestionList(pageIndex: pageIndex);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
