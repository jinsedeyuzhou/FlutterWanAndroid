
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/pages/home/models/banner_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/image.dart';

class ViewPagerBanner extends StatelessWidget with BaseWidgetMixin {
  List<BannerEntity> banners = <BannerEntity>[];

  ViewPagerBanner({Key? key, required this.banners}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    if (banners.isNotNullOrEmpty()) {
      return  SizedBox(
        height: 220.h,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: banners.length,
          itemBuilder: (context, index) {
            final banner = banners[index];
            return netImageCached(banner.imagePath,
                width: double.infinity, height: double.infinity);
          },
          onPageChanged: (position) {
            //TODO 跳转到详情页
          },
        ),
      );
    }
    return Container();
  }
}
