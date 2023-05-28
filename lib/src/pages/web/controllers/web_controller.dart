import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/base/news_base_controller.dart';
import 'package:flutter_news/src/routes/constant.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebController extends NBaseController {
  final _title = "".obs;

  String get title => _title.value;

  final _url = "".obs;

  String get url => _url.value;

  final _progress = 0.obs;

  int get progress => _progress.value;

  final _webViewController = WebViewController().obs;

  WebViewController get webViewController => _webViewController.value;

  void back() {
    Get.back();
  }

  @override
  void onInit() {
    _url(Get.parameters[Constant.URL]);
    _title(Get.parameters[Constant.TITLE]);

    _webViewController.value = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            _progress(progress);
          },

          onPageStarted: (String url) {

          },
          onPageFinished: (String url) {

          },
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://')||request.url.startsWith('http://')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    super.onInit();
  }
}
