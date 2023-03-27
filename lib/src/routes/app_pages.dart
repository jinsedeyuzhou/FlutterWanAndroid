import 'package:flutter/cupertino.dart';
import 'package:flutter_news/src/middleware/welcome_middleware.dart';
import 'package:flutter_news/src/pages/ask/bindings/ask_binding.dart';
import 'package:flutter_news/src/pages/ask/views/ask_view.dart';
import 'package:flutter_news/src/pages/login/bindings/sign_in_binding.dart';
import 'package:flutter_news/src/pages/login/bindings/sign_up_binding.dart';
import 'package:flutter_news/src/pages/login/views/sign_in_view.dart';
import 'package:flutter_news/src/pages/settings/bindings/settings_binding.dart';
import 'package:flutter_news/src/pages/settings/views/settings_view.dart';
import 'package:flutter_news/src/pages/system/bindings/system_binding.dart';
import 'package:flutter_news/src/pages/unknow/views/unknow_view.dart';
import 'package:flutter_news/src/pages/user/bindings/user_binding.dart';
import 'package:flutter_news/src/pages/user/views/user_view.dart';
import 'package:flutter_news/src/pages/welcome/bindings/welcome_binding.dart';
import 'package:flutter_news/src/pages/welcome/views/welcome_view.dart';
import 'package:flutter_news/src/routes/route_observers.dart';
import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/home/views/home_view.dart';
import '../pages/main/bindings/main_binding.dart';
import '../pages/main/views/main_view.dart';
import '../pages/system/views/system_view.dart';
import '../pages/unknow/bindings/unknow_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 2),
      ],
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => HomeView(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ASK,
    //   page: () => AskView(),
    //   binding: AskBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SYSTEM,
    //   page: () => SystemView(),
    //   binding: SystemBinding(),
    // ),
    // GetPage(
    //   name: _Paths.USER,
    //   page: () => UserView(),
    //   binding: UserBinding(),
    // ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
      // middlewares:
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignInView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => UnknowView(),
      binding: UnknowBinding(),
    ),
  ];
}
