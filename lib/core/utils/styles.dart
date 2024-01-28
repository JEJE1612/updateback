import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle textStyle18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle30 = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.amber,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle36 = GoogleFonts.poppins(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle20 = GoogleFonts.poppins(
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
}
