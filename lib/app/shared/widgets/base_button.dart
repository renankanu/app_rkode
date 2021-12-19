import 'package:flutter/material.dart';

import '../base_color.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.icon,
    required this.label,
    required this.onPressed,
    this.backgroundColor = BaseColor.tanHide,
    this.labelColor = BaseColor.mirage,
    this.height = 50,
    this.width = double.infinity,
    this.hasBorderSameColor = false,
  }) : super(key: key);

  final IconData? icon;
  final String label;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? labelColor;
  final double? height;
  final double? width;
  final bool? hasBorderSameColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onPressed,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: hasBorderSameColor!
                ? backgroundColor!.withOpacity(0.1)
                : backgroundColor,
            border: hasBorderSameColor!
                ? Border.all(color: backgroundColor!)
                : null,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  icon,
                  color: hasBorderSameColor! ? backgroundColor : labelColor,
                ),
              ),
              Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: hasBorderSameColor! ? backgroundColor : labelColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
