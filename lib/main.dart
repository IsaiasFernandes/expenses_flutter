import 'package:expenses/presentation/viewmodels/transactionViewmodel.dart';
import 'package:expenses/presentation/views/home/myHomePage.dart';
import 'package:expenses/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 16),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 20),
          backgroundColor: Color(AppColors.colorPrimary),
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(AppColors.colorSecondary),
          primary: Color(AppColors.colorPrimary),
          secondary: Color(AppColors.colorSecondary),
        ),
      ),
      home: ChangeNotifierProvider(
          create: (context) => TransactionViewModel(),
          child: MyHomePage()),
    );
  }
}
