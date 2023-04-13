import 'package:flutter/widgets.dart';
import 'package:flutter_arch/flavors/build_config.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  static const int _maxLineWidth = 90;

  @override
  void onInit() {
    httpClient.baseUrl = BuildConfig.instance.config.baseUrl;

    // 请求拦截
    httpClient.addRequestModifier<void>((request) {
      request.headers['Authorization'] = '12345678';
      return request;
    });


    // 响应拦截
    httpClient.addResponseModifier((request, response) {
      printLong("$runtimeType ${request.url}");
      LoggerUtil.instance().i(response.body);
      return response;
    });
  }
}
