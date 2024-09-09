import 'package:balancee/core/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_chart/fl_chart.dart';

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
              child: LineChart(
                LineChartData(
                    titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              interval: 700,
                              reservedSize: 10),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(maxIncluded: true,
                          interval: 1,
                          reservedSize: 22,
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            List month = ['Jan', 'Feb', 'Mar' 'Apr', 'May', 'June'];
                            return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: FittedBox(child: Text(month[0])));
                          },
                        ))),
                    lineBarsData: [
                      LineChartBarData(
                        color: chartColor,
                        spots: const [
                          FlSpot(0, 0),
                          FlSpot(1, 5),
                          FlSpot(2, 5),
                          FlSpot(3, 7),
                          FlSpot(5, 3),
                        ],
                        curveSmoothness: .78,
                        isCurved: true,
                        barWidth: 4,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.blue.withOpacity(.2),
                        ),
                        preventCurveOverShooting: true,

                        //show: true
                      )

                      // read about it in the LineChartData section
                    ]),
              ),
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
