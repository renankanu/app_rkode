import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Enter your name',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
