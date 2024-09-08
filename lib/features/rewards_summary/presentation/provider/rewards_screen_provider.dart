import 'dart:async';
import 'dart:convert';

import 'package:balancee/features/rewards_summary/domain/models/cashback_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RewardsProvider with ChangeNotifier {
  RewardsProvider() {
    loadJsonAsset();
  }
  late Map<String, dynamic> map;
  late CashBackModel _cashBack = CashBackModel.fromJson(map);
  CashBackModel get cashBack => _cashBack;

  Future loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString(
        'lib/features/rewards_summary/data/local_data/cashback.json');
    map = json.decode(jsonString);
  }
}
