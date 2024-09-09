import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

import 'core/styles/themes/themeProvider.dart';
import 'features/rewards_summary/domain/provider/rewards_screen_provider.dart';
import 'features/rewards_summary/rewards_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
    builder: (context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RewardsProvider(),
          ),
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        child: InitScreen()
      );
    },
    enabled: false,
  ));
}
