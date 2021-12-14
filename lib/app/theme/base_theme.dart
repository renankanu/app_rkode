import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/shared.dart';

class BaseTheme {
  BaseTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: BaseColor.martinique,
      scaffoldBackgroundColor: BaseColor.eastBay,
      textTheme: GoogleFonts.rubikTextTheme(),
    );
  }
}
