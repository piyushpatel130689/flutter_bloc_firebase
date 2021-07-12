import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piyush_flutter_bloc/common/sizeconfig.dart';

abstract class MyStyles {
  //TEXT STYLE
  static TextStyle fontSmallText() =>
      GoogleFonts.mcLaren(color: Colors.black, fontSize: SizeConfig.fontSmallSize);

  static TextStyle fontSmallTextBold() => GoogleFonts.mcLaren(
      color: Colors.black,
      fontSize: SizeConfig.fontSmallSize,
      fontWeight: FontWeight.bold);

  static TextStyle fontRegularText() => GoogleFonts.mcLaren(
      color: Colors.black, fontSize: SizeConfig.fontRegularSize);

  static TextStyle fontRegularTextBold() => GoogleFonts.mcLaren(
      color: Colors.black,
      fontSize: SizeConfig.fontRegularSize,
      fontWeight: FontWeight.bold);

  static TextStyle fontMediumText() => GoogleFonts.mcLaren(
      color: Colors.black, fontSize: SizeConfig.fontMediumSize);

  static TextStyle fontMediumTextBold() => GoogleFonts.mcLaren(
      color: Colors.black,
      fontSize: SizeConfig.fontMediumSize,
      fontWeight: FontWeight.bold);

  static TextStyle fontLargeText() =>
      GoogleFonts.mcLaren(color: Colors.black, fontSize: SizeConfig.fontLargeSize);

  static TextStyle fontLargeTextBold() => GoogleFonts.mcLaren(
      color: Colors.black,
      fontSize: SizeConfig.fontLargeSize,
      fontWeight: FontWeight.bold);

  static TextStyle fontScreenTitleText() => GoogleFonts.mcLaren(
      color: Colors.white,
      fontSize: SizeConfig.fontScreenTitleSize);

  static TextStyle fontScreenTitleTextBold() => GoogleFonts.mcLaren(
      color: Colors.white,
      fontSize: SizeConfig.fontScreenTitleSize,
      fontWeight: FontWeight.bold);

  static TextStyle fontButtonText() => GoogleFonts.mcLaren(
      color: Colors.white,
      fontSize: SizeConfig.fontButtonSize);

  static TextStyle fontButtonTextBold() => GoogleFonts.mcLaren(
      color: Colors.white,
      fontSize: SizeConfig.fontButtonSize,
      fontWeight: FontWeight.bold);

  //ICON STYLE
  static const preferenceIcon = IconData(
    0xf443,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );
}
