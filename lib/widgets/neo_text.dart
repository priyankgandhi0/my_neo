import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text neoTextCommen(
    String text, {
      Color? color,
      double? fontsize,
      FontWeight? weight,
      TextAlign? align,
      int? maxLine = 2,
      TextOverflow? overflow,
      String? fontFamily,
      double? height,
    }) {
  return Text(
    text.trim(),
    textAlign: align,
    maxLines: maxLine,
    style: TextStyle(
      color: color,
      fontFamily: fontFamily ?? GoogleFonts.poppins().fontFamily,
      fontSize: fontsize,
      fontWeight: weight,
      height: height,
      overflow: overflow,
    ),
  );
}
