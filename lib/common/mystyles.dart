import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:piyush_flutter_bloc/common/sizeconfig.dart';

abstract class MyStyles {
  //TEXT STYLE
  static TextStyle fontSmallText() =>
      TextStyle(color: Colors.black, fontSize: SizeConfig.fontSmallSize);

  static TextStyle fontSmallTextBold() => TextStyle(
      color: Colors.black,
      fontSize: SizeConfig.fontSmallSize,
      fontWeight: FontWeight.bold);

  static TextStyle fontMediumText() =>
      TextStyle(color: Colors.black, fontSize: SizeConfig.fontMediumSize);

  static TextStyle fontMediumTextBold() => TextStyle(
      color: Colors.black,
      fontSize: SizeConfig.fontMediumSize,
      fontWeight: FontWeight.bold);

  static TextStyle fontLargeText() =>
      TextStyle(color: Colors.black, fontSize: SizeConfig.fontLargeSize);

  static TextStyle fontLargeTextBold() => TextStyle(
      color: Colors.black,
      fontSize: SizeConfig.fontLargeSize,
      fontWeight: FontWeight.bold);

  //ICON STYLE
  static const preferenceIcon = IconData(
    0xf443,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );
}
