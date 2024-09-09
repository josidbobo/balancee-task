
import 'package:balancee/features/rewards_summary/presentation/widgets/darkModeIcon.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/themes/themeProvider.dart';
import '../../../../core/helper/size.dart';
import '../widgets/cashbackHistory_widgets/cashback_history.dart';
import '../widgets/cashout_widgets/cashout.dart';
import '../widgets/earningOverview_widgets/earning_overview.dart';

class RewardsSummaryScreen extends StatefulWidget {
  const RewardsSummaryScreen({super.key});

  @override
  State<RewardsSummaryScreen> createState() => _RewardsSummaryScreenState();
}

class _RewardsSummaryScreenState extends State<RewardsSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: prov.themeData.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Rewards Summary'),
        scrolledUnderElevation: 2,
        actions: [

          ThemeToggleButton(prov)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EarningOverview(context: context, theme: prov.themeData),
             spacer(),
            CashBackHistory(context: context, theme: prov.themeData),
             spacer(),
            CashoutOptions(prov.themeData, context: context),
          ],
        ),
      ),
    );
  }


  // Cashout Options Section

}


