import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/user/controllers/user_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/src/service/settings_service.dart';
import 'package:get/get.dart';

class UserView extends NBaseView<UserController> {
  bool _isChinese = (Get.locale?.countryCode == "CN");

  UserView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 250,
        ),
        SizedBox(
            height: 48,
            child: InkWell(
              onTap: () {
                // Get.changeThemeMode(
                //     Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                if (!_isChinese) {
                  SettingsService.to.changeLanguage(const Locale("zh", "CN"));
                  SettingsService.to.changeThemeMode(ThemeMode.light);
                  _isChinese = true;
                } else {
                  SettingsService.to.changeLanguage(const Locale("en", "US"));
                  SettingsService.to.changeThemeMode(ThemeMode.dark);
                  _isChinese = false;
                }
              },
              child: Row(
                children: [
                  const Icon(
                    Feather.settings,
                  ),
                  Expanded(
                      child: Text(
                          AppLocalizations.of(Get.context!)!.systemSettings)),
                  const Icon(Feather.chevron_right),
                ],
              ),
            )),
      ],
    );
  }
}
