import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_arch/flutter_provider_arch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/src/widget/view_state.dart';
import 'package:get/get.dart';

abstract class NBaseView<T extends BaseController> extends BaseView<T> {
  NBaseView({super.key});

  @override
  ThemeData get theme => Theme.of(Get.context!);

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  @override
  Widget showLoading() {
    return const Loading();
  }

  void onPressed() {}

  @override
  Widget showErrorWidget() {
    return ViewStateErrorWidget(
        errorMessage: controller.errorMessage, onPressed: onPressed);
  }
}
