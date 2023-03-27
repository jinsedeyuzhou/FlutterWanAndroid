import 'package:flutter_news/src/data/respository/wanandroid_repository.dart';
import 'package:flutter_news/src/data/respository/wanandroid_repository_impl.dart';
import 'package:get/get.dart';


class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WanAndroidRepository>(
      () => WanAndroidRepositoryImpl(),
      tag: (WanAndroidRepository).toString(),
    );
  }
}
