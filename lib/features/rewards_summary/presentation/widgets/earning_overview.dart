import 'package:balancee/core/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../domain/provider/rewards_screen_provider.dart';
import 'chart_info.dart';

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
      color: theme.scaffoldBackgroundColor.withOpacity(.09),
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
            const SizedBox(height: 9),
            SizedBox(
              height: MediaQuery.of(context).size.height * .14,
              child: const ChartInfo(),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Cashback Earned',
                        style: theme.textTheme.displayMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 3),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        'N${context.read<RewardsProvider>().cashBack.totalCashBack.toStringAsFixed(2)}',
                        key: ValueKey(context
                            .read<RewardsProvider>()
                            .cashBack
                            .totalCashBack),
                        style: theme.textTheme.displayLarge!
                            .copyWith(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Balance',
                        style: theme.textTheme.displayMedium),
                    const SizedBox(height: 3),
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
