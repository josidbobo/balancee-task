import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/provider/rewards_screen_provider.dart';

class EarningOverview extends StatelessWidget {
  const EarningOverview({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Earnings Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total Cashback Earned',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    AnimatedSwitcher( 
                      duration: Duration(milliseconds: 400),
                      child: Text(
                        'N${context.read<RewardsProvider>().cashBack.totalCashBack.toStringAsFixed(2)}',
                        key: ValueKey(context
                            .read<RewardsProvider>()
                            .cashBack
                            .totalCashBack),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Current Balance', style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 5),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
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
