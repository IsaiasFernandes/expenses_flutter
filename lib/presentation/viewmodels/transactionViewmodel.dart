import 'package:flutter/cupertino.dart';

import '../../domain/models/transaction.dart';

class TransactionViewModel extends ChangeNotifier {

  final List<Transaction> _transactions = [
    Transaction(id: 'T1', title: 'Novo Tênis de Corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 'T2', title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];
  List<Transaction> get transactions => _transactions;

  void addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    _transactions.add(newTransaction);
    notifyListeners();
  }
}
