import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final getTheme = ThemeData.light().copyWith(
  textTheme: TextTheme(
    headline6: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline5: GoogleFonts.poppins(
      color: new Color(0xff7A7A7A)
    ),
    headline4: GoogleFonts.poppins(
      color: new Color(0xff7A7A7A),
      fontSize: 17.5
    ),
    headline3: GoogleFonts.roboto(
      color: new Color(0xff3F90F6),
      fontSize: 15
    ),
    subtitle1: GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      color: new Color(0xff7A7A7A)
    ),
    subtitle2: GoogleFonts.roboto(
      color: new Color(0xff7A7A7A)
    ),

  ),
  
);