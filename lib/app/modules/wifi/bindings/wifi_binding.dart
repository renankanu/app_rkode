import 'package:get/get.dart';

import '../controllers/wifi_controller.dart';

class WifiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WifiController>(
      () => WifiController(),
    );
  }
}
