import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/data/model/base_common_response.dart';
import 'package:flutter_news/src/pages/system/model/system_entity.dart';
import 'package:flutter_news/src/pages/system/model/navigation_list_state.dart';
import 'package:flutter_news/src/pages/system/model/navigation_entity.dart';
import 'package:flutter_news/src/pages/system/model/system_list_state.dart';
import 'package:get/get.dart';

import '../../../data/model/response_code.dart';
import '../../../data/respository/wanandroid_repository.dart';

class SystemController extends BaseController {
  final WanAndroidRepository _repository =
      Get.find(tag: (WanAndroidRepository).toString());

  final systemState = SystemListState();
  final navigationState = NavigationListState();

  @override
  void onInit() {
    getSystemList();
    super.onInit();
  }

  void getNavigationList() {
    callDataService(_repository.getNavigationList(),
        onSuccess: _handleNavigationResponse, onError: (e) {
          printLong("$runtimeType $e");
        });
  }

  void _handleNavigationResponse(
      BaseCommonResponse<NavigationEntity> response) {
    if (response.errorCode == ResponseCode.SUCESS) {
      printLong("$runtimeType _handleNavigationResponse");
      navigationState.navigations.value=(response.data);
    }
  }

  void getSystemList() {
    callDataService(_repository.getSystemList(),
        onStart: (){
          getNavigationList();
        },
        onSuccess: _handleSystemResponse, onError: (e) {
          printLong("$runtimeType $e");
        });
  }

  void _handleSystemResponse(BaseCommonResponse<SystemEntity> response) {
    if (response.errorCode == ResponseCode.SUCESS) {
      printLong("$runtimeType _handleSystemResponse");
      systemState.systems.value=(response.data);
    }
  }
}
