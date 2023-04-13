import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/data/model/base_response_list.dart';
import 'package:flutter_news/src/utils/http.dart';


class AskAPI {
  static Future<BaseListResponse<ArticleEntity>> getQuestionList(
      {int pageIndex = 1, bool refresh = false, bool cacheDisk = false}) async {
    var result = await HttpUtil().get("/wenda/list/$pageIndex/json");
    BaseListResponse<ArticleEntity> response = BaseListResponse.fromJson(
        result, (json) => ArticleEntity.fromJson(json));
    return response;
  }
}
