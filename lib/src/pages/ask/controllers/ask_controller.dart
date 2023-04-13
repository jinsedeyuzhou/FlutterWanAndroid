import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/data/get_connect/ask_repository.dart';
import 'package:flutter_news/src/data/remote/ask_api.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/respository/wanandroid_repository.dart';
import '../models/question_answer_state.dart';

class AskController extends BaseController {
  final WanAndroidRepository _repository =
      Get.find(tag: (WanAndroidRepository).toString());

  final IAskRepository repository;

  AskController({required this.repository});

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  @override
  void onInit() {
    super.onInit();
  }

  final state = QueAnsState();

  int curPage = 1;
  int pageSize = 20;
  int total = 20;

  void onRefresh() {
    curPage = 1;
    showLoading();
    fetchAskList(isRefresh: true).then((_) {
      hideLoading();
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
      refreshController.refreshFailed();
      hideLoading();
    });

    // repository.getQuestionList(pageIndex: curPage);
  }

  void onLoading() {
    if (state.questionList.length <=total) {
      fetchAskList().then((_) {
        refreshController.loadComplete();
      }).catchError((_) {
        refreshController.loadFailed();
      });
    } else {
      refreshController.loadNoData();
    }
  }

  Future<void> fetchAskList({bool isRefresh = false}) async {
    var result = await AskAPI.getQuestionList(pageIndex: curPage);
    if (isRefresh == true) {
      curPage = 1;
      state.questionList.clear();
    } else {
      curPage++;
    }
   total=result.data.total??0;
    //TODO 改进有问题
    state.questionList.addAll(result.data.datas);
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
