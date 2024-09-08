class CashBackModel {
  CashBackModel({
    required this.totalCashBack,
    required this.currentBalance,
    required this.transactions,
  });

  late final int totalCashBack;
  late final int currentBalance;
  late final List<Transactions> transactions;

  CashBackModel.fromJson(Map<String, dynamic> json) {
    totalCashBack = json['period'] ?? 0;
    currentBalance = json['currentBalance'] ?? 0;
    transactions = List<Transactions>.from(json['transactions']
        .map((transaction) => Transactions.fromJson(transaction)));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalCashback'] = totalCashBack;
    return _data;
  }
}

class Transactions {
  Transactions({
    required this.date,
    required this.amount,
    required this.bookingId,
    required this.serviceName,
  });

  late final String date, bookingId, serviceName;
  late final int amount;

  Transactions.fromJson(Map<String, dynamic> json) {
    date = json['date'] ?? "null";
    amount = json['amount'] ?? "null";
    bookingId = json["bookingId"] ?? "null";
    serviceName = json["seviceName"] ?? "null";
  }
}
