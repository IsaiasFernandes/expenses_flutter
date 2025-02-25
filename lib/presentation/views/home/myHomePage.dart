import 'package:expenses/presentation/viewmodels/transactionViewmodel.dart';
import 'package:expenses/presentation/views/home/form/transactionInputForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/strings.dart';
import 'card/cardAdpter.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.tituloApp),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Expanded(
                child: Consumer<TransactionViewModel>(
                    builder: (context, viewModel, child) => Column(
                      children: viewModel.transactions
                          .map((tr) => CardAdapter(transaction: tr))
                          .toList(),
                    )
                ),
            ),
            TransactionInputForm(),
          ],
        ),
      ),
    );
  }
}
