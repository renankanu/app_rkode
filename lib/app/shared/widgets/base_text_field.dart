import 'package:flutter/material.dart';

import '../base_color.dart';

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
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: BaseColor.goldSand,
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: BaseColor.goldSand,
        ),
      ),
    );
  }
}
