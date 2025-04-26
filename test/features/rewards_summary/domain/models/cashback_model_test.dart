import 'package:flutter_test/flutter_test.dart';
import 'package:balancee_task/features/rewards_summary/domain/models/cashback_model.dart';

void main() {
  group('CashBackModel Tests', () {
    test('should create CashBackModel from valid JSON', () {
      final json = {
        'totalCashback': 100.0,
        'currentBalance': 50.0,
        'transactions': [
          {
            'date': '2024-04-26',
            'amount': 25.0,
            'bookingId': '12345',
            'serviceName': 'Hotel Booking'
          }
        ]
      };

      final model = CashBackModel.fromJson(json);

      expect(model.totalCashBack, equals(100.0));
      expect(model.currentBalance, equals(50.0));
      expect(model.transactions.length, equals(1));
      expect(model.transactions[0].date, equals('2024-04-26'));
      expect(model.transactions[0].amount, equals(25.0));
      expect(model.transactions[0].bookingId, equals('12345'));
      expect(model.transactions[0].serviceName, equals('Hotel Booking'));
    });

    test('should handle missing values in JSON with defaults', () {
      final json = {
        'transactions': []
      };

      final model = CashBackModel.fromJson(json);

      expect(model.totalCashBack, equals(0));
      expect(model.currentBalance, equals(0));
      expect(model.transactions, isEmpty);
    });

    test('should convert to JSON correctly', () {
      final model = CashBackModel(
        totalCashBack: 100.0,
        currentBalance: 50.0,
        transactions: [
          Transactions(
            date: '2024-04-26',
            amount: 25.0,
            bookingId: '12345',
            serviceName: 'Hotel Booking'
          )
        ],
      );

      final json = model.toJson();

      expect(json['totalCashback'], equals(100.0));
    });
  });

  group('Transactions Tests', () {
    test('should create Transactions from valid JSON', () {
      final json = {
        'date': '2024-04-26',
        'amount': 25.0,
        'bookingId': '12345',
        'serviceName': 'Hotel Booking'
      };

      final transaction = Transactions.fromJson(json);

      expect(transaction.date, equals('2024-04-26'));
      expect(transaction.amount, equals(25.0));
      expect(transaction.bookingId, equals('12345'));
      expect(transaction.serviceName, equals('Hotel Booking'));
    });

    test('should handle missing values in JSON with defaults', () {
      final json = {};

      final transaction = Transactions.fromJson(json);

      expect(transaction.date, equals('null'));
      expect(transaction.amount, equals('null'));
      expect(transaction.bookingId, equals('null'));
      expect(transaction.serviceName, equals('null'));
    });
  });
} 