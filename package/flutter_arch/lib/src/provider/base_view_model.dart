
import 'package:flutter_arch/src/provider/view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../flutter_arch.dart';

abstract class BaseViewModel<T extends Object> extends ViewModel {
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
    initialLoadStatus: LoadStatus.noMore,
  );

  T? data;

  init() async {
    initPage(isInit: true);
    await loadRemoteData();
  }

  Future<T?> loadRemoteData() async {
    try {
      var response = await loadData();
      if (isInit) {
        initPage(isInit: false);
      }
      data = response;
      refreshController.refreshCompleted();
      notifyListeners();
      return data;
    } catch (e, s) {
      printLong(e.toString());
      refreshController.loadFailed();
      return null;
    }
  }

  Future<T> loadData();

  /// 下拉刷新
  Future<T> onRefresh();
}
