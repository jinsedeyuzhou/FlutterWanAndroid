import 'package:flutter/cupertino.dart';
import 'package:flutter_news/src/middleware/welcome_middleware.dart';
import 'package:flutter_news/src/pages/history/read_history_binding.dart';
import 'package:flutter_news/src/pages/history/read_history_view.dart';
import 'package:flutter_news/src/pages/login/bindings/sign_in_binding.dart';
import 'package:flutter_news/src/pages/login/bindings/sign_up_binding.dart';
import 'package:flutter_news/src/pages/login/views/sign_in_view.dart';
import 'package:flutter_news/src/pages/scan/bindings/scan_binding.dart';
import 'package:flutter_news/src/pages/scan/views/scan_view.dart';
import 'package:flutter_news/src/pages/search/views/search_view.dart';
import 'package:flutter_news/src/pages/settings/bindings/settings_binding.dart';
import 'package:flutter_news/src/pages/settings/views/settings_view.dart';
import 'package:flutter_news/src/pages/tab/bindings/tab_list_binding.dart';
import 'package:flutter_news/src/pages/tab/views/tab_list_view.dart';
import 'package:flutter_news/src/pages/unknow/views/unknow_view.dart';
import 'package:flutter_news/src/pages/web/bindings/web_binding.dart';
import 'package:flutter_news/src/pages/web/views/web_browser.dart';
import 'package:flutter_news/src/pages/welcome/bindings/welcome_binding.dart';
import 'package:flutter_news/src/pages/welcome/views/welcome_view.dart';
import 'package:flutter_news/src/routes/route_observers.dart';
import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../pages/login/views/sign_up_view.dart';
import '../pages/main/bindings/main_binding.dart';
import '../pages/main/views/main_view.dart';
import '../pages/search/bindings/search_binding.dart';
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
      name: Routes.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 2),
      ],
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: Routes.TAB_SYSTEM_ARTICLE,
      page: () => TabListView(),
      binding: TabListBinding(),
    ),
    GetPage(
      name: Routes.READ_HISTORY,
      page: () => ReadHistoryView(),
      binding: ReadHistoryBinding(),
    ),
    GetPage(
      name: Routes.WEB,
      page: () => WebBrowser(),
      binding: WebBinding(),
    ),
    GetPage(
      name: Routes.OTHER,
      page: () => UnknowView(),
      binding: UnknowBinding(),
    ),
  ];
}
