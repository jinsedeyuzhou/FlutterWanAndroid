import 'package:app_widget/app_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/data/local/db/read_history.dart';
import 'package:flutter_news/src/data/model/article_entity.dart';
import 'package:flutter_news/src/pages/home/widget/animated_provider.dart';
import 'package:flutter_news/src/service/db_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../routes/app_pages.dart';
import '../../../routes/constant.dart';
import '../../../widget/image.dart';
import '../controllers/home_contoller.dart';
import '../widget/item_article_list.dart';

class HomeView extends NBaseView<HomeController> {
  @override
  String? get tag => (HomeController).toString();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  void onPressed() {
    controller.onRefresh();
    super.onPressed();
  }

  @override
  Widget body(BuildContext context) {
    print("$runtimeType home");
    var bannerHeight = MediaQuery.of(context).size.width * 5 / 11;
    // controller.setScrollController(PrimaryScrollController.of(context));
    return Obx(
      () => MediaQuery.removePadding(
        context: context,
        removeTop: false,
        child: RefreshConfiguration.copyAncestor(
          maxOverScrollExtent: 50,
          context: context,
          child: SmartRefresher(
            controller: controller.refreshController,
            scrollController: controller.smartScrollController,
            enablePullUp: true,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  // surfaceTintColor: Colors.lightBlue,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: controller.showTopBtn
                        ? Brightness.light
                        : Brightness.dark,
                    statusBarBrightness: controller.showTopBtn
                        ? Brightness.light
                        : Brightness.dark,
                  ),
                  expandedHeight: bannerHeight,
                  leading: EmptyAnimatedSwitcher(
                    display: controller.showTopBtn,
                    child: _bulidLeading(),
                  ),
                  actions: [
                    EmptyAnimatedSwitcher(
                      display: controller.showTopBtn,
                      child: _buildSearchAction(),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: _buildBanner(),
                    centerTitle: true,
                    title: GestureDetector(
                      onDoubleTap: controller.onDoubleTap,
                      child: EmptyAnimatedSwitcher(
                        display: controller.showTopBtn,
                        child: Text(
                          appLocalization.homeTitle,
                          style: whiteText18,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
                ),
                if (false) SliverToBoxAdapter(child: _buildBanner()),
                if (controller.topArticleState.topArticles.isNotEmpty)
                  _buildTopArticleList(),
                _buildArticleList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildBanner() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Swiper(
        loop: true,
        autoplay: true,
        autoplayDelay: 5000,
        pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(size: 5.0, activeSize: 5.0)),
        itemCount: controller.bannerState.banners.length,
        itemBuilder: (context, index) {
          final banner = controller.bannerState.banners[index];
          return InkWell(
            onTap: () async {
              var parameters = <String, String>{
                Constant.URL: banner.url,
                Constant.TITLE: banner.title
              };
              Get.toNamed(Routes.WEB, parameters: parameters);
            },
            child: netImageCached(banner.imagePath,
                width: double.infinity, height: double.infinity),
          );
        },
      ),
    );
  }

  _bulidLeading() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SCAN);
      },
      child: const Icon(
        Ionicons.ios_scan_outline,
        color: Colors.white,
      ),
    );
  }

  _buildSearchAction() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SEARCH);
      },
      child: const SizedBox(
        width: 34,
        height: 34,
        child: Icon(
          AntDesign.search1,
          color: Colors.white,
        ),
      ),
    );
  }

  _buildTopArticleList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        ArticleEntity article = controller.topArticleState.topArticles[index];
        return ItemArticleList(
          article: article,
          top: true,
          index: index,
          onTap: () {
            var parameters = <String, String>{
              Constant.URL: article.link,
              Constant.TITLE: article.title
            };
            DbService.to.insertReadHistory(ReadHistory.optional(
                cid: article.chapterId,
                link: article.link,
                title: article.title));
            Get.toNamed(Routes.WEB, parameters: parameters);
          },
        );
      }, childCount: controller.topArticleState.topArticles.length ?? 0),
    );
  }

  _buildArticleList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        ArticleEntity article = controller.articleListState.articles[index];
        return ItemArticleList(
          article: article,
          index: index,
          onTap: () {
            var parameters = <String, String>{
              Constant.URL: article.link,
              Constant.TITLE: article.title
            };
            DbService.to.insertReadHistory(ReadHistory.optional(
                cid: article.chapterId,
                link: article.link,
                title: article.title));
            Get.toNamed(Routes.WEB, parameters: parameters);
          },
        );
      }, childCount: controller.articleListState.articles.length ?? 0),
    );
  }

  @override
  Widget? floatingActionButton() {
    return Obx(() => ScaleAnimatedSwitcher(
          child: controller.showTopBtn
              ? FloatingActionButton(
                  key: const ValueKey(Icons.vertical_align_top),
                  onPressed: controller.onDoubleTap,
                  backgroundColor: theme.primaryColor,
                  mini: true,
                  shape: CircleBorder(
                    side: BorderSide(color: theme.primaryColor),
                  ),
                  child: const Icon(
                    Icons.vertical_align_top,
                    color: Colors.white,
                  ),
                )
              : FloatingActionButton(
                  onPressed: () {
                    Get.toNamed(Routes.SEARCH);
                  },
                  backgroundColor: theme.primaryColor,
                  mini: true,
                  shape: CircleBorder(
                    side: BorderSide(color: theme.primaryColor),
                  ),
                  key: const ValueKey(Icons.search),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
        ));
  }

  @override
  Widget showLoading() {
    return const SizedBox.shrink();
  }
}
