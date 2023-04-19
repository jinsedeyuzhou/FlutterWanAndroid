import 'package:flutter_news/src/base/news_base_controller.dart';
import 'package:flutter_news/src/pages/system/model/system_entity.dart';
import 'package:get/get.dart';

class TabListController extends NBaseController {

  final _tabTitle = "".obs;

  String get tabTitle => _tabTitle.value;

  final _tabList = <Children>[].obs;

  List<Children> get tabList => _tabList.value;


  @override
  void onInit() {
    var systemEntity = Get.arguments;
    if (systemEntity is SystemEntity) {
      _tabTitle(systemEntity.name);
      _tabList(systemEntity.children);
    }
    super.onInit();
  }

  void back() {
    Get.back();
  }

}
