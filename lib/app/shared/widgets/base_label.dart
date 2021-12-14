import 'package:flutter/material.dart';

class BaseLabel extends StatelessWidget {
  const BaseLabel({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
