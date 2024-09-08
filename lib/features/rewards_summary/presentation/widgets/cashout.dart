import 'package:balancee/core/styles/themes/themeProvider.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/helpers.dart';


class CashoutOptions extends StatelessWidget {
  const CashoutOptions(
    this.prov,
    {
    super.key,
    required this.context,
  });

  final BuildContext context;
  final ThemeData prov;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cashout Options:',
            style: prov.textTheme.displayLarge),
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
