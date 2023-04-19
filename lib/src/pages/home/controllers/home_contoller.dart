import 'package:flutter/cupertino.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/data/respository/wanandroid_repository.dart';
import 'package:flutter_news/src/pages/home/models/article_list_state.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/model/base_common_response.dart';
import '../../../data/model/base_response_list.dart';
import '../../../data/model/response_code.dart';
import '../models/banner_entity.dart';
import '../models/banner_state.dart';
import '../models/top_article_state.dart';

class HomeController extends BaseController with ScrollMixin {
  final WanAndroidRepository _repository =
      Get.find(tag: (WanAndroidRepository).toString());

  HomeController();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  final _scrollController = ScrollController().obs;

  ScrollController get scrollController => _scrollController.value;

  final bannerState = BannerState();

  final articleListState = ArticleListState();

  final topArticleState = TopArticleState();

  final _showTopBtn = false.obs;

  bool get showTopBtn => _showTopBtn.value;

  double _height = 200;
  int curPage = 0;
  int pageSize = 20;
  int total = 20;

  @override
  void dispose() {
    print("$runtimeType dispose");
    refreshController.dispose();
    bannerState.banners.close();
    topArticleState.topArticles.close();
    articleListState.articles.close();
    _showTopBtn.close();
    scrollController.dispose();
    _scrollController.close();
    super.dispose();
  }

  void setScrollController(ScrollController scrollController) {
    print("$runtimeType setScrollController");

    _scrollController(scrollController);
    scrollController.addListener(() {
      if ((scrollController.offset) > _height && !showTopBtn) {
        _showTopBtn(true);
      } else if ((scrollController.offset) < _height && showTopBtn) {
        _showTopBtn(false);
      }
    });
  }

  void onDoubleTap() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic);
  }

  @override
  void onInit() {
    onRefresh();
    super.onInit();
  }

  void onRefresh() {
    curPage = 0;
    callDataService(
      _repository.getHomeBanner(),
      onSuccess: _handleBannerResponseSucess,
    );
    callDataService(
      _repository.getTopArticles(),
      onSuccess: _handleTopArticlesResponseSucess,
    );
    callDataService(_repository.getHomeArticles(pageIndex: curPage),
        onSuccess: _handleArticleListResponseSucess, onError: (e) {
      refreshController.refreshCompleted(resetFooterState: true);
      refreshController.refreshFailed();
    });
  }

  /// 解析Banner 数据
  void _handleBannerResponseSucess(BaseCommonResponse<BannerEntity> response) {
    if (response.errorCode == ResponseCode.SUCESS) {
      bannerState.banners(response.data);
    }
  }

  /// 解析置顶接口
  void _handleTopArticlesResponseSucess(
      BaseCommonResponse<ArticleEntity> response) {
    if (response.errorCode == ResponseCode.SUCESS) {
      topArticleState.topArticles(response.data);
    }
  }

  /// 解析首页列表数据
  void _handleArticleListResponseSucess(
      BaseListResponse<ArticleEntity> response) {
    refreshController.refreshCompleted(resetFooterState: true);
    if (response.errorCode == ResponseCode.SUCESS) {
      if (curPage == 0) {
        articleListState.articles.clear();
      }
      articleListState.articles.addAll(response.data.datas);
      if (response.data.datas.isEmpty) {
        refreshController.loadNoData();
      }
    }
  }

  void onLoading() {
    curPage++;
    callDataService(_repository.getHomeArticles(pageIndex: curPage),
        onSuccess: _handleArticleListResponseSucess, onError: (e) {
      refreshController.refreshCompleted(resetFooterState: true);
      refreshController.refreshFailed();
    });
  }

  @override
  Future<void> onEndScroll() async {}

  @override
  Future<void> onTopScroll() async {}
}
