import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piyush_flutter_bloc/lib.dart';

final lightTheme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  brightness: Brightness.light,
  primaryColorDark: MyColors.primaryColorDark,
  primaryColorLight: MyColors.primaryColorLight,
  primaryColor: MyColors.primaryColor,
  accentColor: MyColors.accentColor,
  backgroundColor: MyColors.scaffoldBackgroundColor,
  scaffoldBackgroundColor: MyColors.scaffoldBackgroundColor,
  inputDecorationTheme: InputDecorationTheme(
    // labelStyle: TextStyle(color: Colors.black),
    // hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
    selectedItemColor: Colors.redAccent,
    elevation: 0,
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  // appBarTheme: AppBarTheme(
  //   color:MyColors.primaryColor,
  //   elevation: 0,
  // ),
);
