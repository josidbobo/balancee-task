import 'package:balancee/features/rewards_summary/presentation/screens/rewards_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await WidgetsFlutterBinding();

  runApp(DevicePreview(
    builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: const RewardsSummaryScreen());
    },
    enabled: false,
  ));
}
