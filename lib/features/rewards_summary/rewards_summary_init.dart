import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/provider/rewards_screen_provider.dart';
import 'presentation/screens/rewards_summary_screen.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RewardsProvider(),
        builder: (context, provider) {
          return const RewardsSummaryScreen();
        });
  }
}