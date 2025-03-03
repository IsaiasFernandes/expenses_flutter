import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../domain/models/transaction.dart';

class TransactionViewModel extends ChangeNotifier {

  final List<Transaction> _transactions = [
    Transaction(id: 'T1', title: 'Novo Tênis de Corrida', value: 310.76, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(id: 'T2', title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(id: 'T3', title: 'Conta de Luz', value: 10.50, date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(id: 'T4', title: 'Conta de Luz', value: 800.00, date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(id: 'T5', title: 'Conta de Luz', value: 350.00, date: DateTime.now().subtract(Duration(days: 6)))
  ];
  List<Transaction> get transactions => _transactions;

  void addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    _transactions.add(newTransaction);
    notifyListeners();
  }

  List<Transaction> get recentTransations {
    return transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7),
      ));
    }).toList();
  }

  double calculateSumTransactionsOnDate(DateTime data) {
    List<Transaction> transacoesFiltradas = recentTransations.where((transacao) {
      return transacao.date.day == data.day &&
          transacao.date.month == data.month &&
          transacao.date.year == data.year;
    }).toList();

    // Calcula a soma dos valores das transações filtradas
    return transacoesFiltradas.isEmpty
        ? 0.00
        : transacoesFiltradas.map((transacao) => transacao.value).reduce((valueA, valueB) => valueA + valueB);
  }
}
