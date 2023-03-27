import 'package:flutter/cupertino.dart';
import 'package:flutter_news/src/service/auth_service.dart';
import 'package:flutter_news/src/service/storage_service.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class RouteWelcomeMiddleware extends GetMiddleware {

  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

@override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) {
   print("$runtimeType redirectDelegate");
    return super.redirectDelegate(route);
  }
  @override
  RouteSettings? redirect(String? route) {
    print("$runtimeType redirect");
    if (StorageService.to.isFirstOpen==false) {
      return null;
    } else if (AuthService.to.isLoggedInValue) {
      return const RouteSettings(name: Routes.MAIN);
    } else {
      return const RouteSettings(name: Routes.MAIN);
    }
  }
}
