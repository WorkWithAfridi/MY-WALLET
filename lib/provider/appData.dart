import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppData {
  String fontForGoogleFonts = 'Roboto';
  Color customWhite=Color(0xffcccccc);
  late TextStyle headerTextStyleBlack = GoogleFonts.getFont(
    fontForGoogleFonts,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: customWhite,
    ),
  );
  late TextStyle headerTextStyleWhite = GoogleFonts.getFont(
    fontForGoogleFonts,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: customWhite,
    ),
  );
  late TextStyle normalTextStyle = GoogleFonts.getFont(
    fontForGoogleFonts,
    textStyle: TextStyle(
        color: customWhite, fontSize: 14, fontWeight: FontWeight.w400),
  );
  late TextStyle normalHighLightTextStyle = GoogleFonts.getFont(
    fontForGoogleFonts,
    textStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: customWhite,
    ),
  );
}
