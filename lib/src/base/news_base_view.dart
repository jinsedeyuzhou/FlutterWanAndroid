import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/src/service/settings_service.dart';
import 'package:get/get.dart';

abstract class NBaseView<T extends BaseController> extends BaseView<T> {
  NBaseView({super.key});

  ThemeData get theme => Theme.of(Get.context!);

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  @override
  Color pageBackgroundColor() {
    return theme.primaryColor;
  }

  @override
  Color statusBarColor() {
    return theme.primaryColor;
  }

  @override
  Brightness statusBarIconBrightness() {
    return SettingsService.to.themeMode==ThemeMode.dark? Brightness.dark : Brightness.light;
  }

  @override
  Widget showLoading() {
    return const Loading();
  }
}
