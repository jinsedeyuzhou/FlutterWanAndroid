import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/src/base/news_base_view.dart';

import '../controllers/settings_controller.dart';
import '../widgets/item_settings_widgets.dart';
class SettingsView extends NBaseView<SettingsController> {
  late AppLocalizations appLocalization;

  SettingsView({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    appLocalization= AppLocalizations.of(context)!;
    return CustomAppBar(
      appBarTitleText: appLocalization.bottomNavSettings,
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ItemSettings(
          title: appLocalization.settingsTheme,
          prefixImage: 'ic_theme.png',
          suffixImage: 'arrow_forward.svg',
          onTap: _onThemeItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: appLocalization.settingsLanguage,
          prefixImage: 'ic_language.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: _onLanguageItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: appLocalization.settingsFontSize,
          prefixImage: 'ic_font_size.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: _onFontSizeItemClicked,
        ),
        _getHorizontalDivider(),
      ],
    );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  void _onThemeItemClicked() {
    showToast('Theme: Development in progress');
  }

  void _onLanguageItemClicked() {
    showToast('Language: Development in progress');
  }

  void _onFontSizeItemClicked() {
    showToast('Font Size: Development in progress');
  }

}
