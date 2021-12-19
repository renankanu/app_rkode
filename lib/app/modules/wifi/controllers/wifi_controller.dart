import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class WifiController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ScreenshotController screenshotController = ScreenshotController();

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
    if (formKey.currentState!.validate()) {
      dataQrCode =
          'WIFI:S:${nameController.text};T:$wifiSecurity;P:${passwordController.text};;';
    }
  }

  @override
  void onClose() {
    dataQrCode = '';
    super.onClose();
  }

  Future<void> shareQrCode() async {
    if (dataQrCode != '') {
      await screenshotController
          .capture(delay: const Duration(milliseconds: 10))
          .then((Uint8List? image) async {
        if (image != null) {
          final directory = await getTemporaryDirectory();
          final now = DateTime.now().toString();
          final imagePath =
              await File('${directory.path}/RKodeWIFI$now.png').create();
          await imagePath.writeAsBytes(image);

          await Share.shareFiles(
            [imagePath.path],
            text: 'Esse é meu wifi! 😁',
          );
        }
      });
    }
  }
}
