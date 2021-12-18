import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WifiController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Rx<String> _wifiSecurity = ''.obs;
  final Rx<String> _dataQrCode = ''.obs;

  String get wifiSecurity => _wifiSecurity.value;
  String get dataQrCode => _dataQrCode.value;

  set wifiSecurity(String value) => _wifiSecurity.value = value;
  set dataQrCode(String value) => _dataQrCode.value = value;

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

  void generateQrCode() {
    dataQrCode =
        'WIFI:S:${nameController.text};T:$wifiSecurity;P:${passwordController.text};;';
  }
}
