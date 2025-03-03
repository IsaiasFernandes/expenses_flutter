import 'dart:core';

import 'package:expenses/domain/models/transaction.dart';
import 'package:expenses/presentation/views/home/chart/chartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/transactionViewmodel.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  List<Map<String, dynamic>> groupedTransactions(BuildContext context) {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      final viewModel = Provider.of<TransactionViewModel>(
        context,
        listen: false,
      );

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': viewModel.calculateSumTransactionsOnDate(weekDay),
      };
    });
  }

  double weekTotalValue(BuildContext context) {
    return groupedTransactions(context).fold(0.0, (sum, tr) {
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionsCard = groupedTransactions(context);
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Container(
        height: 150,
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: transactionsCard.map((tr) {
              return Expanded(
                child: ChartBar(
                  label: tr['day'].toString(),
                  value: tr['value'],
                  percentage: weekTotalValue(context) == 0 ? 0 : tr['value'] / weekTotalValue(context),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
