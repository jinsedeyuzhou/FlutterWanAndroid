import 'package:get/get.dart';

import 'app_service_binding.dart';
import 'local_source_bindings.dart';
import 'remote_source_bindings.dart';
import 'repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    AppServiceBindings().dependencies();
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    LocalSourceBindings().dependencies();
  }
}
