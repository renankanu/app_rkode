import 'package:app_rkode/app/shared/base_color.dart';
import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    Key? key,
    this.labelText,
  }) : super(key: key);

  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: BaseColor.goldSand,
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: BaseColor.goldSand,
        ),
      ),
    );
  }
}
