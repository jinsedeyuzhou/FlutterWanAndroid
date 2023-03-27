import 'package:flutter/cupertino.dart';
import 'package:flutter_news/src/routes/app_pages.dart';
import 'package:get/get.dart';

import '../service/auth_service.dart';

/// 中间件
class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) {
    if (!AuthService.to.isLoggedInValue) {
      // final newRoute = Routes.LOGIN_THEN(route.pageSettings!.name);
      // return RouteDecoder.fromRoute(Routes.PROFILE);
    }
    return super.redirectDelegate(route);
  }

  //在查找被调用路由的页面时会调用该函数。
  // 它需要 RouteSettings 作为重定向的结果。或者给它 null 并且不会有重定向。
  @override
  RouteSettings? redirect(String? route) {
    if (AuthService.to.isLoggedInValue ||
        route == Routes.SIGN_IN ||
        route == Routes.SIGN_UP ||
        route == Routes.INITIAL) {
      return null;
    }
    Future.delayed(
        const Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));
    return const RouteSettings(name: Routes.SIGN_IN);
  }

//在创建任何内容之前调用此页面时将调用此函数，您可以使用它来更改页面的某些内容或为其提供新页面
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }

  //该函数将在绑定初始化后立即调用。
  // 在创建绑定之后和创建页面小部件之前，您可以在这里做一些事情。
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return super.onBindingsStart(bindings);
  }

  //此函数将在调用 GetPage.page 函数后立即调用，并将为您提供该函数的结果。并获取将要显示的小部件。
  @override
  Widget onPageBuilt(Widget page) {
    return super.onPageBuilt(page);
  }

  //此函数将在处理页面的所有相关对象（控制器、视图等）后立即调用。
  @override
  void onPageDispose() {
    super.onPageDispose();
  }
}
