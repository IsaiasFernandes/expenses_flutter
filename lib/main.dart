import 'package:expenses/presentation/viewmodels/transactionViewmodel.dart';
import 'package:expenses/presentation/views/home/myHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

      home: ChangeNotifierProvider(
          create: (context) => TransactionViewModel(),
          child: MyHomePage()),
    );
  }
}
