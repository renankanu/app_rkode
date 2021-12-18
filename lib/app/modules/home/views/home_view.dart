import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/shared.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 800),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 100,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              const Text(
                'RKode;',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: BaseColor.bunting,
                ),
              ),
              const SizedBox(height: 48),
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
      ),
    );
  }
}
