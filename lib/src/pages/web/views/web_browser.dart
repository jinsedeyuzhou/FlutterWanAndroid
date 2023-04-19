import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/web/controllers/web_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBrowser extends NBaseView<WebController> {
  @override
  PreferredSizeWidget? appBar(Object context) {
    return CustomAppBar(
        leading: InkWell(
          onTap: controller.back,
          child: const Icon(
            Ionicons.chevron_back,
            color: Colors.white,
          ),
        ),
        appBarTitleText: controller.title);
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        if (controller.progress != 100)
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: LinearProgressIndicator(
              value: controller.progress.toDouble(),
              backgroundColor: Colors.white,
              valueColor:  const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
        Expanded(
          flex: 1,
          child: WebViewWidget(controller: controller.webViewController,),
        )
      ],
    );
  }
}
