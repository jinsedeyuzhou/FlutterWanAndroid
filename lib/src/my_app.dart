import 'package:app_data/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/src/routes/app_pages.dart';
import 'package:flutter_news/src/service/settings_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'bindings/initial_binding.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<MyApp> implements RouteAware {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => RefreshConfiguration(
        headerBuilder: () => const WaterDropHeader(),
        footerBuilder: () => const ClassicFooter(),
        hideFooterWhenNotFull: true,
        headerTriggerDistance: 80,
        maxOverScrollExtent: 100,
        footerTriggerDistance: 150,
        child: GetMaterialApp(
          title: _envConfig.appName,
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // theme: ThemeData(),
          theme: AppTheme.lightTheme(),
          themeMode: ThemeMode.light,
          darkTheme: AppTheme.darkTheme(),
          // locale: SettingsService.to.locale,
          locale: SettingsService.to.locale,
          builder: EasyLoading.init(),
          // theme: AppTheme.lightTheme(const AppState()),
          fallbackLocale: const Locale("zh", "CN"),
          navigatorObservers: [AppPages.observer],
          debugShowCheckedModeBanner: false,
          routingCallback: (value) {},
        ),
      ),
    );
  }

  @override
  void didPop() {}

  @override
  void didPopNext() {}

  @override
  void didPush() {}

  @override
  void didPushNext() {}
}
