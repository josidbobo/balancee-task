import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/themes/theme.dart';
import '../../core/styles/themes/themeProvider.dart';
import 'domain/provider/rewards_screen_provider.dart';
import 'presentation/screens/rewards_summary_screen.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              theme: Provider.of<ThemeProvider>(context).themeData,
              darkTheme: AppThemes.dark,
              home: const RewardsSummaryScreen(),
            );
          }
        );
  }
}
