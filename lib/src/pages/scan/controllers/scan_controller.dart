import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/base/news_base_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../../routes/constant.dart';

class ScanController extends NBaseController {
  final Rx<MobileScannerController> _mobileScannerCtr = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
    torchEnabled: false,
  ).obs;

  MobileScannerController get mobileScannerCtr => _mobileScannerCtr.value;

  final _zoomFactor = 0.0.obs;

  double get zoomFactor => _zoomFactor.value;

  final _boxfit = BoxFit.cover.obs;

  BoxFit get boxfit => _boxfit.value;

  final ImagePicker picker = ImagePicker();

  final _barcode = Barcode(rawValue: '').obs;
  BarcodeCapture? capture;
  MobileScannerArguments? arguments;

  Barcode get barcode => _barcode.value;

  void zoomSize(double zoom) {
    _zoomFactor(zoom);
  }

  void setBoxfit() {
    if (boxfit == BoxFit.fill) {
      _boxfit(BoxFit.cover);
    } else if (boxfit == BoxFit.cover) {
      _boxfit(BoxFit.contain);
    } else if (boxfit == BoxFit.contain) {
      _boxfit(BoxFit.fill);
    }
  }

  void setBarcode(Barcode barcode) {
    _barcode(barcode);
  }

  void analyzeImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      final mounted = await mobileScannerCtr.analyzeImage(image.path);
      if (mounted) {
        List<BarcodeCapture> capture = await mobileScannerCtr.barcodes.toList();
        final List<Barcode> barcodes = capture.last.barcodes;
        for (final barcode in barcodes) {
          if (barcode.url != null) {
            var parameters = <String, String>{
              Constant.URL:barcode.rawValue ?? "",
              Constant.TITLE: ""
            };
            Get.toNamed(Routes.WEB, parameters: parameters);
          }
          ToastUtil.show(msg: 'Barcode found! ${barcode.rawValue}');
        }
      }
    }
  }

  void analyzeQrcode() async {}

  @override
  void dispose() {
    mobileScannerCtr.dispose();
    _mobileScannerCtr.close();
    _barcode.close();
    _zoomFactor.close();
    super.dispose();
  }
}
