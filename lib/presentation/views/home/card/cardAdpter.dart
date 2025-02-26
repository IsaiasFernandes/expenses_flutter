import 'package:expenses/domain/models/transaction.dart';
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
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              color: Colors.red.shade400,
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              formattedTittle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                transaction.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    formattedPrice,
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                  SizedBox(width: 16),
                  Text(
                    formattedDate,
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
