import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/pages/home/models/banner_entity.dart';
import 'package:flutter_news/src/pages/search/models/hotkey_entity.dart';
import 'package:flutter_news/src/pages/system/model/system_entity.dart';
import 'package:flutter_news/src/pages/system/model/navigation_entity.dart';

import '../model/base_common_response.dart';
import '../model/base_response_list.dart';

abstract class WanAndroidRemoteDataSource {
  Future<BaseListResponse<ArticleEntity>> getHomeArticles(
      {int pageIndex = 0});

  Future<BaseCommonResponse<BannerEntity>> getHomeBanner();

  Future<BaseCommonResponse<ArticleEntity>> getTopArticles();

  Future<BaseListResponse<ArticleEntity>> getAskArticles(
      {int pageIndex = 0});

  Future<BaseCommonResponse<SystemEntity>> getSystemList();

  Future<BaseCommonResponse<NavigationEntity>> getNavigationList();

  Future<BaseListResponse<ArticleEntity>>  searchArticles({int pageIndex=0,required String key});

  Future<BaseCommonResponse<HotkeyEntity>> searchHotkey();

  Future<BaseListResponse<ArticleEntity>> getSystemArticleList({int pageIndex=0,required int cid});

}
