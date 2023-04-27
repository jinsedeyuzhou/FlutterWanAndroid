import 'package:flutter/cupertino.dart';

abstract class ViewModel extends ChangeNotifier {
  /// 防止页面销毁后,异步任务才完成,导致报错
  bool _disposed = false;

  ///是否初始化
  bool isInit = false;

  /// 初始化当前页
  /// true：初始化
  /// false：已初始化
  initPage({isInit = false}) {
    this.isInit = isInit;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
