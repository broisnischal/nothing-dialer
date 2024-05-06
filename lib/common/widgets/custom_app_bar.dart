import 'package:flutter/material.dart';

AppBar customAppBar({required String title, Widget? leading}) {
  return AppBar(
    title: Text(
      title,
    ),
    leading: leading,
  );
}
