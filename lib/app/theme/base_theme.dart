import 'package:app_rkode/app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: BaseColor.martinique,
      scaffoldBackgroundColor: BaseColor.eastBay,
      fontFamily: 'Montserrat',
      textTheme: GoogleFonts.rubikTextTheme(),
    );
  }
}
