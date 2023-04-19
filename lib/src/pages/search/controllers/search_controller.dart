import 'package:flutter/cupertino.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/base/news_base_controller.dart';
import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/data/model/base_response_list.dart';
import 'package:flutter_news/src/pages/search/models/search_list_state.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/model/base_common_response.dart';
import '../../../data/model/response_code.dart';
import '../../../data/respository/wanandroid_repository.dart';
import '../models/hotkey_entity.dart';

class SearchController extends NBaseController {
  final WanAndroidRepository _repository =
      Get.find(tag: (WanAndroidRepository).toString());

  final TextEditingController textEditingController = TextEditingController();
  final _refreshController = RefreshController(initialRefresh: false).obs;

  RefreshController get refreshController => _refreshController.value;

  SearchListState searchListState = SearchListState();

  final _searchHistorys = <String>[].obs;

  List<String> get searchHistorys => _searchHistorys.value;

  final _inputText = "".obs;

  String get inputText => _inputText.value;

  @override
  void onInit() {
    textEditingController.addListener(() {
      onTextChanged(textEditingController.text);
    });
    searchHotkey();
    // 历史搜索 本地
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    _refreshController.close();
    refreshController.dispose();
    super.dispose();
  }

  void onTextChanged(String text) {
    _inputText(text);
  }

  /// 搜索热词
  void searchHotkey() {
    callDataService(_repository.searchHotkey(), onSuccess: _handleHotkey,
        onError: (e) {
      printLong("$runtimeType $e");
    });
  }

  void _handleHotkey(BaseCommonResponse<HotkeyEntity> response) {
    if (response.errorCode == ResponseCode.SUCESS) {
      searchListState.hotkeyList(response.data);
    }
  }

  /// 搜索热词
  void searchList({int pageIndex = 0, required String seachKey}) {
    callDataService(_repository.searchArticles(key: seachKey),
        onSuccess: _handleSearchList, onError: (e) {
          refreshController.refreshCompleted(resetFooterState: true);
      printLong("$runtimeType $e");
    });
  }

  void _handleSearchList(BaseListResponse<ArticleEntity> response) {
    refreshController.refreshCompleted(resetFooterState: true);
    if (response.errorCode == ResponseCode.SUCESS) {
      searchListState.searchList(response.data.datas);
    }
  }

  void refresh() {

  }

  void loadMore() {}
}
