import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
abstract class NBaseController extends BaseController{
  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;
  ThemeData get theme => Theme.of(Get.context!);
}