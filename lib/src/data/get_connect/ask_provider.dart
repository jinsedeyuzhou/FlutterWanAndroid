
import 'package:flutter_news/src/base/base_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../model/article_entity.dart';
import '../model/base_response_list.dart';

abstract class IAskProvider {
  Future<Response<BaseListResponse<ArticleEntity>>> getQuestionList(
      {int pageIndex = 1, bool refresh = false, bool cacheDisk = false});
}

class AskProvider extends BaseProvider implements IAskProvider {
  @override
  Future<Response<BaseListResponse<ArticleEntity>>> getQuestionList(
      {int pageIndex = 1, bool refresh = false, bool cacheDisk = false}) async {
    var reponse = await get("/wenda/list/$pageIndex/json");
    BaseListResponse<ArticleEntity> response = BaseListResponse.fromJson(
        reponse.body, (json) => ArticleEntity.fromJson(json));
    return Response(body: response);
  }
}
