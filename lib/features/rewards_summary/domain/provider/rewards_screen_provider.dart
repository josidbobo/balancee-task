import 'dart:async';
import 'dart:convert';

import 'package:balancee/features/rewards_summary/data/local_data/cashback_dummy.dart';
import 'package:balancee/features/rewards_summary/domain/models/cashback_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RewardsProvider with ChangeNotifier {
  
  late final CashBackModel _cashBack = CashBackModel.fromJson(dummy);
  CashBackModel get cashBack => _cashBack;

  
}
