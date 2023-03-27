import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/base/news_base_view.dart';

import '../controllers/unknow_controller.dart';

class UnknowView extends NBaseView<UnknowController> {
  final String viewParam;

  UnknowView({super.key, this.viewParam = ""});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: viewParam);
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'UnknowView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
