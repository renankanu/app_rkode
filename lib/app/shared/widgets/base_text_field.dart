import 'package:flutter/material.dart';

import '../base_color.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
    this.controller, {
    Key? key,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: BaseColor.mirage,
      enableSuggestions: true,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: BaseColor.mirage,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: BaseColor.mirage,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: BaseColor.mirage,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: BaseColor.mirage,
          ),
        ),
        labelStyle: const TextStyle(
          color: BaseColor.mirage,
        ),
      ),
      validator: validator,
    );
  }
}
