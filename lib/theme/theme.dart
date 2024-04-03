import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixease/theme/const.dart';

final theme = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: accentColor,
  scaffoldBackgroundColor: secondaryColor,
  barBackgroundColor: secondaryColor,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 16,
        fontWeight: FontWeight.w400),
    navActionTextStyle: const TextStyle(
      color: accentColor,
      fontSize: 16,
      inherit: false,
    ),
  ),
);
