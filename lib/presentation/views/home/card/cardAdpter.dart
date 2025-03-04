import 'package:expenses/domain/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/CardUtils.dart';
import '../../../viewmodels/transactionViewmodel.dart';

class CardAdapter extends Card {
  late final Transaction transaction;
  late final String formattedDate;
  late final String formattedPrice;
  late final String formattedTittle;
  final void Function(String) onRemove;

  CardAdapter({required this.transaction, required this.onRemove}) {
    formattedDate = formatDate(transaction.date);
    formattedPrice = formatValue(transaction.value);
    formattedTittle = generateAcronym(transaction.title);
  }

  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(formattedPrice, overflow: TextOverflow.ellipsis),
            ),
            SizedBox(width: 8),
            Flexible(
              child: Text(formattedDate, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => onRemove(transaction.id.toString()),
        ),
      ),
    );
  }
}
