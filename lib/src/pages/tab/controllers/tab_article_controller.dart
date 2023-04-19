import 'package:flutter/cupertino.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/base/news_base_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/model/article_entity.dart';
import '../../../data/model/base_response_list.dart';
import '../../../data/model/response_code.dart';
import '../../../data/respository/wanandroid_repository.dart';
import '../model/tab_list_state.dart';

class TabArticleController extends NBaseController {
  final WanAndroidRepository _repository =
      Get.find(tag: (WanAndroidRepository).toString());

  TabListState tabListState = TabListState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;
  int curPage = 0;
  int pageSize = 20;
  int total = 20;
  int cid = 0;

  void setCid(int id) {
    cid = id;
    curPage = 0;
    getSystemArticles(cid: cid);
  }

  @override
  void onInit() {
    super.onInit();
  }

  void getSystemArticles({required int cid}) {
    callDataService(
        _repository.getSystemArticleList(pageIndex: curPage, cid: cid),
        onSuccess: _handleSystemArticles, onError: (e) {
      printLong("$runtimeType $e");
    });
  }

  void _handleSystemArticles(BaseListResponse<ArticleEntity> response) {
    if (response.errorCode == ResponseCode.SUCESS) {
      if (curPage == 0) {
        tabListState.articles.clear();
      }
      tabListState.articles.addAll(response.data.datas);
      if (response.data.datas.isEmpty) {
        refreshController.loadNoData();
      }
    }
  }

  Future<void> onRefresh() async {
    curPage = 0;
    getSystemArticles(cid: cid);
  }

  void onLoad() {
    curPage++;
    // getSystemArticles(cid: cid);
  }
}
