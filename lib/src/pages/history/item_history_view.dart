import 'package:app_widget/res/app_colors.dart';
import 'package:app_widget/res/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/base/news_base_widget_mixin.dart';
import 'package:flutter_news/src/data/local/db/read_history.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/app_pages.dart';
import '../../routes/constant.dart';

class ItemHistoryView extends StatelessWidget with NBaseWidgetMixin {
  final ReadHistory history;
  final int index;

  final GestureTapCallback? onTap;

  ItemHistoryView(
      {super.key, required this.history, required this.index, this.onTap});

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () async {
              var parameters = <String, String>{
                Constant.URL: history.link??"",
                Constant.TITLE: history.title,
              };
              Get.toNamed(Routes.WEB, parameters: parameters);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history.title,
                    style: const TextStyle(
                        color: AppColors.textColorPrimary, fontSize: 16),
                  ),
                  Text(
                    DateUtil.formatDate(
                      history.timestamp,
                      format: 'yyyy年M月d日 HH时mm分ss秒',
                    ),
                    style: const TextStyle(
                        color: AppColors.textColorThird, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
