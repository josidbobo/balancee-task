import 'package:balancee/features/rewards_summary/presentation/provider/rewards_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            padding: const EdgeInsets.all(16.0),
            child: ChangeNotifierProvider(
              create: (context) => RewardsProvider(),
              builder: (context, provider) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEarningsOverview(),
                    SizedBox(height: 20),
                    _buildCashbackHistory(),
                    SizedBox(height: 20),
                    _buildCashoutOptions(),
                  ],
                );
              }
            ),
          ),
        );
  }

  // Earnings Overview Section
  Widget _buildEarningsOverview() {
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
                    Text('Total Cashback Earned',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        '\$${context.read<RewardsProvider>().cashBack.totalCashBack.toStringAsFixed(2)}',
                        key: ValueKey(context.read<RewardsProvider>().cashBack.totalCashBack),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Balance', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        '\$${context.read<RewardsProvider>().cashBack.currentBalance.toStringAsFixed(2)}',
                        key: ValueKey(context.read<RewardsProvider>().cashBack.currentBalance.toStringAsFixed(2)),
                        style: TextStyle(
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
          itemCount: context.read<RewardsProvider>().cashBack.transactions.length,
          itemBuilder: (context, index) {
            var transaction = context.read<RewardsProvider>().cashBack.transactions[index];
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text(transaction.serviceName),
                subtitle: Text('Booking ID: ${transaction.bookingId}'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$${transaction.amount.toStringAsFixed(2)}',
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
        Text('Cashout Options',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _showSnackBar('Cashing out directly!');
              },
              icon: Icon(Icons.attach_money),
              label: Text('Cashout'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _showSnackBar('Promo code applied!');
              },
              icon: Icon(Icons.card_giftcard),
              label: Text('Apply Promo Code'),
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
