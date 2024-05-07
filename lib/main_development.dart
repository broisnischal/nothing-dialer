import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:nothing_dialer/app/app.dart';
import 'package:nothing_dialer/bootstrap.dart';
import 'package:nothing_dialer/di/injection_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await FlutterDisplayMode.setHighRefreshRate();
    configureDependencies(Env.development);
  } catch (e) {
    log(e.toString());
  }

  await bootstrap(App.new);
}
