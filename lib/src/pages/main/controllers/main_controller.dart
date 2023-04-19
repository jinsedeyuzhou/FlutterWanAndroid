import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

import '../model/menu_code.dart';
import 'bottom_nav_controller.dart';

class MainController extends BaseController {
  MenuCode selectedMenuCode = MenuCode.HOME;

  onMenuSelected(MenuCode menuCode) async {
    selectedMenuCode = menuCode;
    handleNavBarTap(menuCode.index);
  }

  // 页控制器
  PageController pageController = PageController();
  final navController = BottomNavController();

  /// scheme 内部打开
  bool isInitialUriIsHandled = false;
  StreamSubscription? uriSub;

  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // 第一次打开
  Future<void> handleInitialUri() async {
    if (!isInitialUriIsHandled) {
      isInitialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          // 这里获取了 scheme 请求
          print('got initial uri: $uri');
        }
      } on PlatformException {
        print('falied to get initial uri');
      } on FormatException catch (err) {
        print('malformed initial uri, ' + err.toString());
      }
    }
  }

  // 程序打开时介入
  void handleIncomingLinks() {
    if (!kIsWeb) {
      uriSub = uriLinkStream.listen((Uri? uri) {
        // 这里获取了 scheme 请求
        if (kDebugMode) {
          print('got uri: $uri');
        }

        if (uri != null && uri.path == '/notify/category') {
          Get.toNamed(Routes.SIGN_IN);
        }
      }, onError: (Object err) {
        print('got err: $err');
      });
    }

  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    uriSub?.cancel();
    pageController.dispose();
    super.dispose();
  }
  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  void onInit() {
    // handleInitialUri();
    // handleIncomingLinks();
    pageController = PageController(initialPage: selectedMenuCode.index);
    super.onInit();
  }
}
