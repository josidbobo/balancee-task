import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'features/rewards_summary/rewards_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
    builder: (context) {
      return const InitScreen();
    },
    enabled: false,
  ));
}
