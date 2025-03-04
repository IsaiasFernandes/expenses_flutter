

import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return date.hour == 00 && date.minute == 00 ?
  DateFormat('d MMM y').format(date) :
  DateFormat('d MMM y HH:mm').format(date);

}

String formatValue(double value) {
  return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
}

String generateAcronym(String text) {
  final List<String> stopwords = [
    'de', 'da', 'do', 'dos', 'das', 'e', 'para', 'com', 'a', 'o', 'as', 'os',
    'um', 'uma', 'uns', 'umas', 'por', 'no', 'na', 'nos', 'nas'
  ];

  List<String> words = text
      .split(' ')
      .where((word) => !stopwords.contains(word.toLowerCase()))
      .toList();

  String acronym = words.map((word) => word[0].toUpperCase()).join();

  return acronym;
}