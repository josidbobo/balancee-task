import 'package:balancee/features/rewards_summary/domain/provider/rewards_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants/size.dart';
import '../widgets/earning_overview.dart';

class RewardsSummaryScreen extends StatefulWidget {
  const RewardsSummaryScreen({super.key});

  @override
  State<RewardsSummaryScreen> createState() => _RewardsSummaryScreenState();
}

class _RewardsSummaryScreenState extends State<RewardsSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards Summary'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EarningOverview(context: context),
             spacer(),
            _buildCashbackHistory(),
             spacer(),
            _buildCashoutOptions(),
          ],
        ),
      ),
    );
  }

  // Earnings Overview Section

  // Cashback History Section
  Widget _buildCashbackHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cashback History',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount:
              context.read<RewardsProvider>().cashBack.transactions.length,
          itemBuilder: (context, index) {
            var transaction =
                context.read<RewardsProvider>().cashBack.transactions[index];
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text(transaction.serviceName),
                subtitle: Text('Booking ID: ${transaction.bookingId}'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('N${transaction.amount.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(transaction.date),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Cashout Options Section
  Widget _buildCashoutOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cashout Options:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _showSnackBar('Cashing out directly!');
              },
              icon: Icon(Icons.wallet),
              label: Text('Bank Account'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _showSnackBar('Promo code applied!');
              },
              icon: Icon(Icons.card_giftcard),
              label: Text('As Promo Code'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }

  // Snackbar for feedback
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

