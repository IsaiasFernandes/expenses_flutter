import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/strings.dart';
import '../flatbutton/customflatbutton.dart';

class CustomDatePicker extends StatelessWidget {
  DateTime selectedDate = DateTime.now();
  final Function(DateTime) onDateChanged;

  CustomDatePicker({required this.selectedDate, required this.onDateChanged});

  _showdatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(2025),
            maximumDate: DateTime.now(),
            onDateTimeChanged: onDateChanged,
          ),
        )
        : Container(
          height: 70,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedDate == null
                      ? AppStrings.nenhumaDataSeliecionada
                      : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                ),
              ),
              CustomFlatButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Theme.of(context).primaryColor,
                tituloBotao: AppStrings.selecionarData,
                onPressed: () => _showdatePicker(context),
              ),
            ],
          ),
        );
  }
}
