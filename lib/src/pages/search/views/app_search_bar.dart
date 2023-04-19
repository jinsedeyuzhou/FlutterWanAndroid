import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/base/news_base_widget_mixin.dart';
import 'package:flutter_news/src/pages/search/controllers/search_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSearchBar extends StatelessWidget with NBaseWidgetMixin {
  final controller = Get.find<SearchController>();

  @override
  Widget body(BuildContext context) {
    var custBorder = const OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.all(Radius.circular(24)),
    );
    return Obx(() => AnnotatedRegion(
          value: SystemUiOverlayStyle(
              statusBarBrightness:
                  controller.darkMode ? Brightness.light : Brightness.dark,
              statusBarIconBrightness:
                  controller.darkMode ? Brightness.dark : Brightness.light,
              statusBarColor: theme.primaryColor),
          sized: true,
          child: Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
            height: 54 + ScreenUtil().statusBarHeight,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Ionicons.chevron_back,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 35,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 1,
                      cursorColor: theme.primaryColor,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: theme.primaryColorDark,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        hintText: "搜索一下",
                        border: custBorder,
                        enabledBorder: custBorder,
                        focusedBorder: custBorder,
                        focusedErrorBorder: custBorder,
                        errorBorder: custBorder,
                        hintStyle: const TextStyle(
                            color: Colors.white70, fontSize: 14),
                        suffixIcon:
                            controller.inputText.isNotEmpty
                                ? IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      controller.textEditingController.text =
                                          "";
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )
                                : null,
                      ),
                      controller: controller.textEditingController,
                      onSubmitted: (value) {
                        controller.searchList(
                            seachKey: controller.textEditingController.text);
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.searchList(
                        seachKey: controller.textEditingController.text);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
