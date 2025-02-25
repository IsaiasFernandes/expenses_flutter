import 'package:expenses/presentation/views/home/myHomePage.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue, // Define a cor principal
        ),
      ),
      home: MyHomePage(),
    );
  }
}
