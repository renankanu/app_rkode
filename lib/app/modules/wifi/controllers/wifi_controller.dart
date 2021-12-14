import 'package:get/get.dart';

class WifiController extends GetxController {
  final Rx<String> _wifiSecurity = ''.obs;

  String get wifiSecurity => _wifiSecurity.value;

  set wifiSecurity(String value) => _wifiSecurity.value = value;

  List<String> wifiSecurityList = [
    'Aberta',
    'WEP',
    'WPA/WPA2',
  ];

  @override
  void onInit() {
    wifiSecurity = wifiSecurityList[0];
    super.onInit();
  }
}
