import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

import '../../../../utils/strings.dart';
import '../../../viewmodels/transactionViewmodel.dart';
import '../flatbutton/customflatbutton.dart';

class TransactionInputForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  double tryParseValue() {
    return double.tryParse(valueController.text
        .replaceAll('R\$ ', '')
        .replaceAll('.', '')
        .replaceAll(',', '.')) ?? 0;
  }

  _submitForm(context) {
    final title = titleController.text;
    final value = tryParseValue();
    if (title.isEmpty || value <= 0) return;
    Provider.of<TransactionViewModel>(context, listen: false)
        .addTransaction(title, value);
    titleController.text = '';
    valueController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: AppStrings.tituloLabel),
                onSubmitted: (_) => _submitForm(context),
              ),
              TextField(
                controller: valueController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyInputFormatter(
                      leadingSymbol: 'R\$',
                      useSymbolPadding: true,
                      thousandSeparator: ThousandSeparator.Period,
                  )
                ],
                decoration: InputDecoration(labelText: AppStrings.valorLabel),
                onSubmitted: (_) => _submitForm(context),
              ),
              CustomFlatButton(
                onPressed: () {
                FocusScope.of(context).unfocus();
                  _submitForm(context);
                },
              ),
            ],
          ),
        ),
    );
  }
}
