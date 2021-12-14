import 'package:app_rkode/app/routes/app_pages.dart';
import 'package:app_rkode/app/shared/shared.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RKode;',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: BaseColor.goldSand,
              ),
            ),
            SizedBox(height: 48),
            BaseButton(
              icon: EvaIcons.wifi,
              label: 'Wifi',
              onPressed: () => Get.toNamed(Routes.wifi),
            ),
            BaseButton(
              icon: EvaIcons.personOutline,
              label: 'Vcard',
              onPressed: () {},
            ),
            BaseButton(
              icon: EvaIcons.navigation2Outline,
              label: 'Localização',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
