import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/base/news_base_controller.dart';
import 'package:flutter_news/src/pages/history/read_history_state.dart';
import 'package:flutter_news/src/service/db_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReadHistoryController extends NBaseController {
  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  ReadHistoryState readHistoryState = ReadHistoryState();

  @override
  void onInit() {
    print("$runtimeType onInit");
    DbService.to
        .findAllReadHistorys()
        .then((value) => {
              printLong("$runtimeType $value"),
              readHistoryState.readHistory(value),
            })
        .catchError((error) {
      print("$runtimeType $error");
    });
    super.onInit();
  }

  void back() {
    Get.back();
  }

  Future<void> clearHistory() async {
   await  DbService.to.deleteAllHistorys();
    readHistoryState.readHistory.clear();
  }

  void onRefresh() {
    refreshController.refreshCompleted();
  }

  void onLoading() {
    refreshController.loadComplete();
    refreshController.loadNoData();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
