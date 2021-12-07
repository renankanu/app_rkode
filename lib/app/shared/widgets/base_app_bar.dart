import 'package:app_rkode/app/shared/shared.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Ink(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: BaseColor.martinique,
              ),
              child: InkWell(
                onTap: () => Get.back(),
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  EvaIcons.arrowIosBack,
                  color: BaseColor.goldSand,
                ),
              ),
            ),
            Center(
              child: Text(
                'Flutter',
                style: Get.textTheme.headline6!.copyWith(
                  color: BaseColor.cavernPink,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
