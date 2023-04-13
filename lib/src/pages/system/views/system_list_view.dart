import 'package:app_widget/res/app_colors.dart';
import 'package:app_widget/res/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/system/model/system_entity.dart';
import 'package:flutter_news/src/pages/system/model/navigation_entity.dart';
import 'package:get/get.dart';

import '../controllers/system_controller.dart';

class SystemListView extends GetView<SystemController> {
  Widget _buildSystemItem(BuildContext context, int index) {
    SystemEntity systemEntity = controller.systemState.systems[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: AppValues.margin,
            left: AppValues.margin,
          ),
          child: Text(
            systemEntity.name,
            style: const TextStyle(
                color: AppColors.textColorPrimary, fontSize: 16),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
              left: AppValues.margin, right: AppValues.margin),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 6,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: systemEntity.children
                .map((e) => MaterialButton(
                      onPressed: () {},
                      height: 34,
                      elevation: 0,
                      padding: const EdgeInsets.only(
                          left: AppValues.margin, right: AppValues.margin),
                      color: const Color(0xfff5f5f5),
                      child: Text(
                        e.name,
                        style: const TextStyle(
                            color: AppColors.textColorPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(Object context) {
    return Obx(() => ListView.builder(
          itemBuilder: (context, index) => _buildSystemItem(context, index),
          itemCount: controller.systemState.systems.length,
        ));
  }
}

class NavigationListView extends GetView<SystemController> {
  Widget _buildSystemItem(BuildContext context, int index) {
    NavigationEntity navigationEntity =
        controller.navigationState.navigations[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: AppValues.margin,
            left: AppValues.margin,
          ),
          child: Text(
            navigationEntity.name,
            style: const TextStyle(
                color: AppColors.textColorPrimary, fontSize: 16),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
              left: AppValues.margin, right: AppValues.margin),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 6,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: navigationEntity.articles
                .map((e) => MaterialButton(
                      onPressed: () {},
                      height: 34,
                      elevation: 0,
                      padding: const EdgeInsets.only(
                          left: AppValues.margin, right: AppValues.margin),
                      color: const Color(0xfff5f5f5),
                      child: Text(
                        e.title,
                        style: const TextStyle(
                            color: AppColors.textColorPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemBuilder: (context, index) => _buildSystemItem(context, index),
          itemCount: controller.navigationState.navigations.length,
        ));
  }
}
