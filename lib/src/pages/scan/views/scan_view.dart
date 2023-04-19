import 'dart:typed_data';

import 'package:app_widget/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_news/src/base/news_base_view.dart';
import 'package:flutter_news/src/pages/scan/controllers/scan_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../../routes/constant.dart';

class ScanView extends NBaseView<ScanController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Obx(
      () => Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            child: MobileScanner(
              fit: controller.boxfit,
              controller: controller.mobileScannerCtr,
              onDetect: (capture) async {
                controller.capture = capture;
                controller.setBarcode(capture.barcodes.first);
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;
                for (final barcode in barcodes) {
                  if (barcode.url != null) {
                    var parameters = <String, String>{
                      Constant.URL: barcode.rawValue??"",
                      Constant.TITLE: "扫描",
                    };
                    Get.toNamed(Routes.WEB, parameters: parameters);
                    Get.back();
                  }
                  // showToast('Barcode found! ${barcode.rawValue}');
                }
              },
              onScannerStarted: (arguments) {
                controller.arguments = arguments;
              },
            ),
            onScaleUpdate: (ScaleUpdateDetails e) {
              if (e.scale == 1.0 && e.rotation == 0.0) {
                return;
              }
              double zoomScale = e.scale.clamp(0.5, 1);
              printLong("$runtimeType zoomScale$zoomScale");
              controller.zoomSize(zoomScale);
              controller.mobileScannerCtr.setZoomScale(zoomScale);
            },
            onScaleEnd: (ScaleEndDetails details) {},
          ),
          if (controller.barcode.corners != null &&
              controller.arguments != null)
            CustomPaint(
              painter: BarcodeOverlay(
                barcode: controller.barcode,
                arguments: controller.arguments!,
                boxFit: BoxFit.contain,
                capture: controller.capture!,
              ),
            ),
          CustomPaint(
            painter: ScannerOverlay(scanWindow),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: ClipOval(
              child: Container(
                color: const Color(0xAFffffff),
                width: 48,
                height: 48,
                child: IconButton(
                  icon: ValueListenableBuilder(
                    valueListenable: controller.mobileScannerCtr.torchState,
                    builder: (context, state, child) {
                      switch (state) {
                        case TorchState.off:
                          return const Icon(Icons.flash_off);
                        case TorchState.on:
                          return const Icon(Icons.flash_on);
                      }
                    },
                  ),
                  color: Colors.white,
                  onPressed: () => controller.mobileScannerCtr.toggleTorch(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ClipOval(
              child: Container(
                color: const Color(0xAFffffff),
                width: 48,
                height: 48,
                child: IconButton(
                  icon: const Icon(AntDesign.picture),
                  color: Colors.white,
                  onPressed: controller.analyzeImage,
                ),
              ),
            ),
          ),
          Positioned(
            top: 16 + ScreenUtil().statusBarHeight,
            left: 16,
            child: ClipOval(
              child: Container(
                color: const Color(0xAFffffff),
                width: 24,
                height: 24,
                child: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  icon: const Icon(
                    Ionicons.ios_close_outline,
                    size: 20,
                  ),
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 16 + ScreenUtil().statusBarHeight,
            right: 16,
            child: ClipOval(
              child: Container(
                color: const Color(0xAFffffff),
                width: 24,
                height: 24,
                child: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  icon: const Icon(
                    MaterialIcons.swap_horiz,
                    size: 20,
                  ),
                  color: Colors.black,
                  onPressed: () {
                    controller.setBoxfit();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRect(scanWindow);

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BarcodeOverlay extends CustomPainter {
  BarcodeOverlay({
    required this.barcode,
    required this.arguments,
    required this.boxFit,
    required this.capture,
  });

  final BarcodeCapture capture;
  final Barcode barcode;
  final MobileScannerArguments arguments;
  final BoxFit boxFit;

  @override
  void paint(Canvas canvas, Size size) {
    if (barcode.corners == null) return;
    final adjustedSize = applyBoxFit(boxFit, arguments.size, size);

    double verticalPadding = size.height - adjustedSize.destination.height;
    double horizontalPadding = size.width - adjustedSize.destination.width;
    if (verticalPadding > 0) {
      verticalPadding = verticalPadding / 2;
    } else {
      verticalPadding = 0;
    }

    if (horizontalPadding > 0) {
      horizontalPadding = horizontalPadding / 2;
    } else {
      horizontalPadding = 0;
    }

    final ratioWidth =
        (GetPlatform.isIOS ? capture.width! : arguments.size.width) /
            adjustedSize.destination.width;
    final ratioHeight =
        (GetPlatform.isIOS ? capture.height! : arguments.size.height) /
            adjustedSize.destination.height;

    final List<Offset> adjustedOffset = [];
    for (final offset in barcode.corners!) {
      adjustedOffset.add(
        Offset(
          offset.dx / ratioWidth + horizontalPadding,
          offset.dy / ratioHeight + verticalPadding,
        ),
      );
    }
    final cutoutPath = Path()..addPolygon(adjustedOffset, true);

    final backgroundPaint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    canvas.drawPath(cutoutPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
