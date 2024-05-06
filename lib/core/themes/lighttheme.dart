import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nothing_dialer/core/constants/color_constants.dart';

ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: Colors.grey.shade100,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConst.whiteColor,
    // color: ColorConst.blackColor,
    titleTextStyle: const TextStyle(color: ColorConst.blackColor),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.grey.shade100,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
);
