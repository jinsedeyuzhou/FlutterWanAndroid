import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';

class ItemSettings extends StatelessWidget with BaseWidgetMixin {
  final String prefixImage;
  final String suffixImage;
  final String title;
  final Function()? onTap;

  ItemSettings({super.key,
    required this.prefixImage,
    required this.suffixImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget body(BuildContext context) {
    return InkWell(
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
            // AssetImageView(
            //   fileName: suffixImage,
            //   color: AppColors.suffixImageColor,
            //   height: AppValues.iconSize_20,
            //   width: AppValues.iconSize_20,
            // ),
          ],
        ),
      ),
    );
  }
}