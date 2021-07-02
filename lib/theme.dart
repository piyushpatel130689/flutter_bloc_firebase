import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF717FE0),
  primaryColorLight: const Color(0xFF8481BA),
  primaryColor: const Color(0xFF062DA0),
  accentColor: const Color(0xFF9C3A97),
  scaffoldBackgroundColor: const Color(0xFFE4E8E8),
  inputDecorationTheme: InputDecorationTheme(
    // labelStyle: TextStyle(color: Colors.black),
    // hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
