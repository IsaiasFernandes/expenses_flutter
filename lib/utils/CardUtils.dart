

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
  // Verifica se o texto é nulo ou vazio
  if (text == null || text.trim().isEmpty) {
    return '';
  }

  // Lista de stopwords (palavras comuns a serem ignoradas)
  final List<String> stopwords = [
    'de', 'da', 'do', 'dos', 'das', 'e', 'para', 'com', 'a', 'o', 'as', 'os',
    'um', 'uma', 'uns', 'umas', 'por', 'no', 'na', 'nos', 'nas'
  ];

  // Divide o texto em palavras, remove as stopwords e gera o acrônimo
  String acronym = text
      .split(' ') // Divide o texto em palavras
      .where((word) => word.trim().isNotEmpty) // Remove palavras vazias
      .where((word) => !stopwords.contains(word.toLowerCase())) // Remove stopwords
      .map((word) => word[0].toUpperCase()) // Pega a primeira letra de cada palavra
      .join(); // Junta as letras para formar o acrônimo

  return acronym;
}