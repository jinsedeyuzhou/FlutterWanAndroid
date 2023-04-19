import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/data/model/base_common_response.dart';
import 'package:flutter_news/src/data/model/base_response_list.dart';
import 'package:flutter_news/src/data/remote/wanandroid_remote_data_source.dart';
import 'package:flutter_news/src/data/respository/wanandroid_repository.dart';
import 'package:flutter_news/src/pages/home/models/banner_entity.dart';
import 'package:flutter_news/src/pages/search/models/hotkey_entity.dart';
import 'package:flutter_news/src/pages/system/model/system_entity.dart';
import 'package:flutter_news/src/pages/system/model/navigation_entity.dart';
import 'package:get/get.dart';

class WanAndroidRepositoryImpl implements WanAndroidRepository {
  final WanAndroidRemoteDataSource _androidRemoteDataSource =
      Get.find(tag: (WanAndroidRemoteDataSource).toString());

  @override
  Future<BaseListResponse<ArticleEntity>> getAskArticles({int pageIndex = 0}) {
    return _androidRemoteDataSource.getAskArticles(pageIndex: pageIndex);
  }

  @override
  Future<BaseListResponse<ArticleEntity>> getHomeArticles({int pageIndex = 0}) {
    return _androidRemoteDataSource.getHomeArticles(pageIndex: pageIndex);
  }

  @override
  Future<BaseCommonResponse<BannerEntity>> getHomeBanner() {
    return _androidRemoteDataSource.getHomeBanner();
  }

  @override
  Future<BaseCommonResponse<NavigationEntity>> getNavigationList() {
    return _androidRemoteDataSource.getNavigationList();
  }

  @override
  Future<BaseCommonResponse<SystemEntity>> getSystemList() {
    return _androidRemoteDataSource.getSystemList();
  }

  @override
  Future<BaseCommonResponse<ArticleEntity>> getTopArticles() {
    return _androidRemoteDataSource.getTopArticles();
  }

  @override
  Future<BaseListResponse<ArticleEntity>> searchArticles(
      {int pageIndex = 0, required String key}) {
    return _androidRemoteDataSource.searchArticles(
        pageIndex: pageIndex, key: key);
  }

  @override
  Future<BaseCommonResponse<HotkeyEntity>> searchHotkey() {
    return _androidRemoteDataSource.searchHotkey();
  }

  @override
  Future<BaseListResponse<ArticleEntity>> getSystemArticleList(
      {int pageIndex = 0, required int cid}) {
    return _androidRemoteDataSource.getSystemArticleList(
        pageIndex: pageIndex, cid: cid);
  }
}
