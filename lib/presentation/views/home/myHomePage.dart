import 'dart:io';

import 'package:expenses/presentation/viewmodels/transactionViewmodel.dart';
import 'package:expenses/presentation/views/home/chart/chart.dart';
import 'package:expenses/presentation/views/home/form/transactionInputForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/strings.dart';
import 'buildEmptyList/buildEmptyList.dart';
import 'card/cardAdpter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  bool _showChart = false;

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return ChangeNotifierProvider.value(
          value: Provider.of<TransactionViewModel>(context, listen: false),
          child: TransactionInputForm(),
        );
      },
    );
  }

  _removeTransaction(String transactionId) {
    final viewModel = Provider.of<TransactionViewModel>(context, listen: false);
    viewModel.removeTransaction(transactionId);
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final availableHeight =
        MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.tituloApp),
        actions: [
          if (isLandscape)
            IconButton(
              onPressed: () {
                setState(() {
                  _showChart = !_showChart;
                });
              },
              icon: Icon(_showChart ? Icons.list : Icons.show_chart),
            ),
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 0.75 : 0.25),
                child: Consumer<TransactionViewModel>(
                  builder: (context, viewModel, child) {
                    return Chart(viewModel.recentTransations);
                  },
                ),
              ),
            if (!_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 1 : 0.75) ,
                child: Consumer<TransactionViewModel>(
                  builder: (context, viewModel, child) {
                    return viewModel.transactions.isEmpty
                        ? buildEmptyList(context)
                        : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10),
                          itemCount: viewModel.transactions.length,
                          itemBuilder: (ctx, index) {
                            return CardAdapter(
                              transaction: viewModel.transactions[index],
                              onRemove: _removeTransaction,
                            );
                          },
                        );
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton:  Platform.isIOS ? Container() : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}
