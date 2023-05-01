import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle defaultTextStyle(
    {Color color = const Color(0XFF9A9A9A),
      num size = 14,
      FontWeight weight = FontWeight.normal,
      TextDecoration? decoration}) {
  return GoogleFonts.poppins(
      color: color,
      fontSize: size.toDouble(),
      fontWeight: weight,
      decoration: decoration);
}
