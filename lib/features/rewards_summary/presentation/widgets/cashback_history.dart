import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/provider/rewards_screen_provider.dart';

class CashBackHistory extends StatelessWidget {
  const CashBackHistory({
    super.key,
    required this.context,
    required this.theme,
  });

  final BuildContext context;
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cashback History',
            style: theme.textTheme.displayLarge),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              context.read<RewardsProvider>().cashBack.transactions.length,
          itemBuilder: (context, index) {
            var transaction =
                context.read<RewardsProvider>().cashBack.transactions[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text(transaction.serviceName),
                subtitle: Text('Booking ID: ${transaction.bookingId}'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('N${transaction.amount.toStringAsFixed(2)}',
                        style: theme.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(transaction.date, style: theme.textTheme.displayMedium,),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
