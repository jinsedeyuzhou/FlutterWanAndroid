import 'package:flutter_news/src/data/respository/wanandroid_repository.dart';
import 'package:flutter_news/src/data/respository/wanandroid_repository_impl.dart';
import 'package:get/get.dart';

import '../data/get_connect/ask_provider.dart';
import '../data/get_connect/ask_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WanAndroidRepository>(
      () => WanAndroidRepositoryImpl(),
      tag: (WanAndroidRepository).toString(),
      fenix: true
    );

    Get.lazyPut<IAskProvider>(
      () => AskProvider(),
        fenix: true
    );
    Get.lazyPut<IAskRepository>(
      () => AskRepository(provider: Get.find()),
        fenix: true
    );
  }
}
