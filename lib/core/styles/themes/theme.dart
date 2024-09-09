import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bprimary,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(primary: wprimary),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(displayMedium: const TextStyle(color: Colors.black), displayLarge: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),),
    canvasColor: wbgColor,
    secondaryHeaderColor: sWhite,
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: dbgColor,
    colorScheme: const ColorScheme.dark().copyWith(primary: bprimary ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(displayMedium: const TextStyle(color: Colors.white), displayLarge: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
    canvasColor: dbgColor,
    secondaryHeaderColor: secondaryColor
  );
}
