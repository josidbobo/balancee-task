import 'package:balancee/features/rewards_summary/domain/provider/rewards_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper/helpers.dart';
import '../../../../core/styles/themes/themeProvider.dart';
import '../../../../core/helper/size.dart';
import '../widgets/cashback_history.dart';
import '../widgets/earning_overview.dart';

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
            _buildCashoutOptions(),
          ],
        ),
      ),
    );
  }


  // Cashout Options Section
  Widget _buildCashoutOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Cashout Options:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                showSnackBar('Cashing out directly!', context);
              },
              icon: const Icon(Icons.wallet),
              label: Text('Bank Account', style: style(),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showSnackBar('Promo code applied!', context);
              },
              icon: const Icon(Icons.card_giftcard),
              label: Text('As Promo Code', style: style(),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }

}


