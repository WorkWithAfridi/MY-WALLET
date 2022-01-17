import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppData {
  String fontForGoogleFonts = 'Dongle';
  Color customWhite=Color(0xffcccccc);
  late TextStyle headerTextStyleBlack = GoogleFonts.getFont(
    fontForGoogleFonts,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: customWhite,
    ),
  );
  late TextStyle headerTextStyleWhite = GoogleFonts.getFont(
    fontForGoogleFonts,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      height: .5,
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
