import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/mycolors.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: MyColors.primaryColorDark,
  primaryColorLight: MyColors.primaryColorLight,
  primaryColor: MyColors.primaryColor,
  accentColor: MyColors.accentColor,
  scaffoldBackgroundColor: MyColors.scaffoldBackgroundColor,
  inputDecorationTheme: InputDecorationTheme(
    // labelStyle: TextStyle(color: Colors.black),
    // hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
