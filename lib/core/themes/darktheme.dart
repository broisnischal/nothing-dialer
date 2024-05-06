import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nothing_dialer/core/constants/color_constants.dart';

ThemeData darkTheme = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  textTheme: const TextTheme(),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorConst.blackColor,
    titleTextStyle: TextStyle(
      color: ColorConst.whiteColor,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  ),
);
