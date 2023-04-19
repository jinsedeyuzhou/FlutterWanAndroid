import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/data/model/base_common_response.dart';
import 'package:flutter_news/src/data/model/base_response_list.dart';
import 'package:flutter_news/src/data/remote/wanandroid_remote_data_source.dart';
import 'package:flutter_news/src/pages/home/models/banner_entity.dart';
import 'package:flutter_news/src/pages/search/models/hotkey_entity.dart';
import 'package:flutter_news/src/pages/system/model/system_entity.dart';
import 'package:flutter_news/src/pages/system/model/navigation_entity.dart';

import '../../routes/api.dart';

class WanAndroidRemoteDataSourceImpl extends BaseRemoteSource
    implements WanAndroidRemoteDataSource {
  @override
  Future<BaseListResponse<ArticleEntity>> getHomeArticles({int pageIndex = 0}) {
    var point = "${Api.HOME_ARTICLE_LIST}/$pageIndex/json";
    var dioCall = dioClient.get(point);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseListResponse.fromJson(
              response.data, (json) => ArticleEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseCommonResponse<BannerEntity>> getHomeBanner() {
    var point = Api.HOME_BANNER;
    var dioCall = dioClient.get(point);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseCommonResponse.fromJson(
              response.data, (json) => BannerEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseListResponse<ArticleEntity>> getAskArticles({int pageIndex = 0}) {
    var point = "${DioProvider.baseUrl}/wenda/list/$pageIndex/json ";
    var dioCall = dioClient.get(point);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseListResponse.fromJson(
              response.data, (json) => ArticleEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseCommonResponse<NavigationEntity>> getNavigationList() {
    var point = Api.NAVIGATION_LIST;
    var dioCall = dioClient.get(point);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseCommonResponse.fromJson(
              response.data, (json) => NavigationEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseCommonResponse<SystemEntity>> getSystemList() {
    var point = Api.KNOWLEDGE_TREE_LIST;
    var dioCall = dioClient.get(point);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseCommonResponse.fromJson(
              response.data, (json) => SystemEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseCommonResponse<ArticleEntity>> getTopArticles() {
    var point = Api.HOME_TOP_ARTICLE_LIST;
    var dioCall = dioClient.get(point);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseCommonResponse.fromJson(
              response.data, (json) => ArticleEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseListResponse<ArticleEntity>> searchArticles(
      {int pageIndex = 0, required String key}) {
    var point = "${DioProvider.baseUrl}/article/query/$pageIndex/json ";
    Map<String, String> params = <String, String>{};
    params["k"] = key;
    var dioCall = dioClient.post(point, queryParameters: params);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseListResponse.fromJson(
              response.data, (json) => ArticleEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseCommonResponse<HotkeyEntity>> searchHotkey() {
    var point = Api.SEARCH_HOT_LIST;
    var dioCall = dioClient.get(point);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseCommonResponse.fromJson(
              response.data, (json) => HotkeyEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseListResponse<ArticleEntity>> getSystemArticleList(
      {int pageIndex = 0, required int cid}) {
    Map<String, String> params = <String, String>{};
    params["cid"] = cid.toString();
    var point = "${Api.KNOWLEDGE_DETAIL_LIST}/$pageIndex/json";
    var dioCall = dioClient.get(point, queryParameters: params);
    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (BaseListResponse.fromJson(
              response.data, (json) => ArticleEntity.fromJson(json))));
    } catch (e) {
      rethrow;
    }
  }
}
