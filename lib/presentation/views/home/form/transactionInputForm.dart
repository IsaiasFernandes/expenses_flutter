import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../utils/strings.dart';
import '../../../viewmodels/transactionViewmodel.dart';
import '../flatbutton/customflatbutton.dart';

class TransactionInputForm extends StatefulWidget {
  @override
  _TransactionInputForm createState() => _TransactionInputForm();
}

class _TransactionInputForm extends State<TransactionInputForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  double tryParseValue() {
    return double.tryParse(
          _valueController.text
              .replaceAll('R\$ ', '')
              .replaceAll('.', '')
              .replaceAll(',', '.'),
        ) ??
        0;
  }

  _submitForm(BuildContext context) {
    final title = _titleController.text;
    final value = tryParseValue();
    final date = _selectedDate;

    if (title.isEmpty || value <= 0) {
      return;
    }

    Provider.of<TransactionViewModel>(
      context,
      listen: false,
    ).addTransaction(title, value, date);

    _titleController.clear();
    _valueController.clear();

    Navigator.of(context).pop();
  }

  _showdatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: AppStrings.tituloLabel),
                onSubmitted: (_) => _submitForm(context),
              ),
              TextField(
                controller: _valueController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyInputFormatter(
                    leadingSymbol: 'R\$',
                    useSymbolPadding: true,
                    thousandSeparator: ThousandSeparator.Period,
                  ),
                ],
                decoration: InputDecoration(labelText: AppStrings.valorLabel),
                onSubmitted: (_) => _submitForm(context),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? AppStrings.nenhumaDataSeliecionada
                            : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                      ),
                    ),
                    CustomFlatButton(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Theme.of(context).primaryColor,
                      tituloBotao: AppStrings.selecionarData,
                      onPressed: _showdatePicker,
                    ),
                  ],
                ),
              ),
              CustomFlatButton(
                tituloBotao: AppStrings.novatransacao,
                backgroundColor: null,
                foregroundColor: null,
                onPressed: () {
                  FocusScope.of(context).unfocus(); // Fecha o teclado
                  _submitForm(context); // Submete o formulário
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
