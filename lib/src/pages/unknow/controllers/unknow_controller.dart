import 'package:flutter_arch/flutter_arch.dart';
import 'package:get/get.dart';


class UnknowController extends BaseController {
  final count = 0.obs;

  void increment() => count.value++;
}
