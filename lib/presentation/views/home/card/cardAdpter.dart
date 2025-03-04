import 'package:expenses/domain/models/transaction.dart';
import 'package:expenses/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../../utils/CardUtils.dart';

class CardAdapter extends Card {
  late final Transaction transaction;
  late final String formattedDate;
  late final String formattedPrice;
  late final String formattedTittle;

  CardAdapter({required this.transaction}) {
    formattedDate = formatDate(transaction.date);
    formattedPrice = formatValue(transaction.value);
    formattedTittle = generateAcronym(transaction.title);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                formattedTittle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Container(
          child: Row(
            children: [
              Text(formattedPrice),
              SizedBox(width: 16),
              Text(formattedDate),
            ],
          ),
        ),
      ),
    );
  }
}
