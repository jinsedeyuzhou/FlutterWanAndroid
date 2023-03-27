import 'package:get/get.dart';
import 'local_source_bindings.dart';
export 'package:flutter_arch/src/data/local/preference/preference_manager.dart';
export 'package:flutter_arch/src/data/local/preference/preference_manager_impl.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceManager>(
          () => PreferenceManagerImpl(),
      tag: (PreferenceManager).toString(),
      fenix: true,
    );
  }
}
