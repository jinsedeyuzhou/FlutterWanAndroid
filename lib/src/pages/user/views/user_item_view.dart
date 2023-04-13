import 'package:app_widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_news/src/base/news_base_widget_mixin.dart';

class UserItemView extends StatelessWidget with NBaseWidgetMixin {
  final IconData prefixImage;
  final IconData suffixImage;
  final String title;
  final Function()? onTap;

  UserItemView({
    super.key,
    required this.prefixImage,
    required this.suffixImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget body(BuildContext context) {
    return Ripple(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Row(
          children: [
            Icon(
              prefixImage,
              size: AppValues.iconSize_20,
              color: theme.primaryColor,
            ),
            const SizedBox(width: AppValues.smallPadding),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textColorPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Icon(
              suffixImage,
              color: AppColors.suffixImageColor,
              size: AppValues.iconSize_20,
            ),
          ],
        ),
      ),
    );
  }
}

class UserSettings extends StatelessWidget with NBaseWidgetMixin {
  final String prefixImage;
  final IconData suffixImage;
  final String title;
  final Function()? onTap;

  UserSettings({
    super.key,
    required this.prefixImage,
    required this.suffixImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget body(BuildContext context) {
    return Ripple(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Row(
          children: [
            AssetImageView(
              fileName: prefixImage,
              height: AppValues.iconSize_20,
              width: AppValues.iconSize_20,
            ),
            const SizedBox(width: AppValues.smallPadding),
            Text(title, style: settingsItemStyle),
            const Spacer(),
            Icon(
              suffixImage,
              color: AppColors.suffixImageColor,
              size: AppValues.iconSize_20,
            ),
          ],
        ),
      ),
    );
  }
}

class UserItemSettings extends StatelessWidget with NBaseWidgetMixin {
  final String prefixImage;
  final String suffixImage;
  final String title;
  final Function()? onTap;

  UserItemSettings({
    super.key,
    required this.prefixImage,
    required this.suffixImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget body(BuildContext context) {
    return Ripple(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Row(
          children: [
            AssetImageView(
              fileName: prefixImage,
              height: AppValues.iconSize_20,
              width: AppValues.iconSize_20,
            ),
            const SizedBox(width: AppValues.smallPadding),
            Text(title, style: settingsItemStyle),
            const Spacer(),
            AssetImageView(
              fileName: suffixImage,
              color: AppColors.suffixImageColor,
              height: AppValues.iconSize_20,
              width: AppValues.iconSize_20,
            ),
          ],
        ),
      ),
    );
  }
}
