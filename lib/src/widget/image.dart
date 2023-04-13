// 缓存图片
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_helper.dart';

Widget netImageCached(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry? margin,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height.h,
      width: width.w,
      margin: margin,
      decoration: BoxDecoration(
        // borderRadius: Radii.k6pxRadius,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.fill,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        height: height.h,
        width: width.w,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) => const Icon(
      AntDesign.picture,
      size: double.infinity,
    ),
  );
}

enum ImageType {
  normal,
  random, //随机
  assets, //资源目录
}

class WrapperImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageType imageType;

  WrapperImage(
      {required this.url,
      required this.width,
      required this.height,
      this.imageType = ImageType.normal,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (_, __) =>
          ImageHelper.placeHolder(width: width, height: height),
      errorWidget: (_, __, ___) =>
          ImageHelper.error(width: width, height: height, size: 25),
      fit: fit,
    );
  }

  String get imageUrl {
    switch (imageType) {
      case ImageType.random:
        return ImageHelper.randomUrl(
            key: url, width: width.toInt(), height: height.toInt());
      case ImageType.assets:
        return ImageHelper.wrapAssets(url);
      case ImageType.normal:
        return url;
    }
  }
}
