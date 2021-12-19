import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../base_color.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField(
    this.controller, {
    Key? key,
    this.validator,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    setState(() {
      _obscureText = widget.keyboardType == TextInputType.visiblePassword;
    });
    super.initState();
  }

  Widget? validSuffix({bool? isPassword}) {
    return isPassword!
        ? InkWell(
            onTap: onShowHidePasswordPress,
            child: SuffixPasswordIcon(obscureText: _obscureText),
          )
        : null;
  }

  void onShowHidePasswordPress() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool _isPassword =
        widget.keyboardType == TextInputType.visiblePassword;

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: BaseColor.mirage,
            ),
      ),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: BaseColor.mirage,
        enableSuggestions: true,
        keyboardType: TextInputType.name,
        obscureText: _obscureText,
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
          suffixIcon: validSuffix(isPassword: _isPassword),
        ),
        validator: widget.validator,
      ),
    );
  }
}

class SuffixPasswordIcon extends StatelessWidget {
  const SuffixPasswordIcon({
    Key? key,
    required this.obscureText,
  }) : super(key: key);

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Icon(
      obscureText ? EvaIcons.eye : EvaIcons.eyeOff,
    );
  }
}
