import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    Key? key,
    required this.title,
    this.onRepeatAction,
  }) : super(key: key);

  final String title;
  final Function()? onRepeatAction;

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
              child: BaseSlideAnimation(
                child: InkWell(
                  onTap: () => Get.back(),
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    EvaIcons.arrowIosBack,
                    color: BaseColor.mirage,
                  ),
                ),
              ),
            ),
            BaseSlideAnimation(
              direction: BaseSlideDirection.topToBottom,
              child: Center(
                child: Text(
                  title,
                  style: Get.textTheme.headline6!.copyWith(
                    color: BaseColor.mirage,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: onRepeatAction != null,
                child: Ink(
                  width: 40,
                  height: 40,
                  child: BaseSlideAnimation(
                    direction: BaseSlideDirection.rightToLeft,
                    child: InkWell(
                      onTap: () => onRepeatAction?.call(),
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        EvaIcons.repeatOutline,
                        color: BaseColor.mirage,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
