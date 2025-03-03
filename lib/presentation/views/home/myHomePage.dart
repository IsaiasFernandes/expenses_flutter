import 'package:expenses/presentation/viewmodels/transactionViewmodel.dart';
import 'package:expenses/presentation/views/home/chart/chart.dart';
import 'package:expenses/presentation/views/home/form/transactionInputForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/strings.dart';
import 'buildEmptyList/buildEmptyList.dart';
import 'card/cardAdpter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.tituloApp),
        actions: [
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
            Consumer<TransactionViewModel>(
              builder: (context, viewModel, child) {
                return Chart(viewModel.recentTransations);
              },
            ),
            Consumer<TransactionViewModel>(
              builder: (context, viewModel, child) {
                return viewModel.transactions.isEmpty
                    ? buildEmptyList(context)
                    : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: viewModel.transactions.length,
                      itemBuilder: (ctx, index) {
                        return CardAdapter(
                          transaction: viewModel.transactions[index],
                        );
                      },
                    );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}
