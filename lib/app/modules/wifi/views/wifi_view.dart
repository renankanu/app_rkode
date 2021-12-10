import 'package:app_rkode/app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/wifi_controller.dart';

class WifiView extends GetView<WifiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BaseAppBar(
            title: 'qrCode Wifi',
          ),
          Center(
            child: Text(
              'WifiView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          BaseTextField()
        ],
      ),
    );
  }
}
