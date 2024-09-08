
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'features/rewards_summary/rewards_summary_init.dart';

void main() async {
  await WidgetsFlutterBinding();

  runApp(DevicePreview(
    builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: const InitScreen());
    },
    enabled: false,
  ));
}
