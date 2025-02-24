import 'package:flutter/material.dart';
import 'home/myHomePage.dart';

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
