import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piyush_flutter_bloc/lib.dart';

final darkTheme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  brightness: Brightness.dark,
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.black,
  primaryColor: Colors.black,
  accentColor: Colors.black,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  inputDecorationTheme: InputDecorationTheme(
    // labelStyle: TextStyle(color: Colors.black),
    // hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.redAccent,
    elevation: 0,
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  // appBarTheme: AppBarTheme(
  //   color: Colors.black,
  //   elevation: 0,
  // ),
);
