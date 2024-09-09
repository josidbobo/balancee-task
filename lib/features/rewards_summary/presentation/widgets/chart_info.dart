import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/color.dart';

class ChartInfo extends StatelessWidget {
  const ChartInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          titlesData: FlTitlesData(
              show: true,
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true, interval: 700, reservedSize: 10),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                maxIncluded: true,
                interval: 1,
                reservedSize: 22,
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  List month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June'];
                  return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: const FittedBox(child: Text('May')));
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
              isCurved: true,
              barWidth: 4,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withOpacity(.2),
              ),
              preventCurveOverShooting: true,

              //show: true
            )
          ]),
    );
  }
}
