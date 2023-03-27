import '/src/data/remote/wanandroid_remote_data_source.dart';
import '/src/data/remote/wanandroid_remote_data_source_impl.dart';
import 'package:get/get.dart';


class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WanAndroidRemoteDataSource>(
      () => WanAndroidRemoteDataSourceImpl(),
      tag: (WanAndroidRemoteDataSource).toString(),
    );
  }
}
