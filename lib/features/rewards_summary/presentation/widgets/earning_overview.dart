import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/provider/rewards_screen_provider.dart';

class EarningOverview extends StatelessWidget {
  const EarningOverview({
    super.key,
    required this.context,
    required this.theme,
  });

  final BuildContext context;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Earnings Overview',
              style: theme.textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Cashback Earned',
                        style: theme.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        'N${context.read<RewardsProvider>().cashBack.totalCashBack.toStringAsFixed(2)}',
                        key: ValueKey(context
                            .read<RewardsProvider>()
                            .cashBack
                            .totalCashBack),
                        style: theme.textTheme.displayLarge!.copyWith(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Balance',
                        style: theme.textTheme.displayMedium),
                    const SizedBox(height: 5),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        'N${context.read<RewardsProvider>().cashBack.currentBalance.toStringAsFixed(2)}',
                        key: ValueKey(context
                            .read<RewardsProvider>()
                            .cashBack
                            .currentBalance
                            .toStringAsFixed(2)),
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
