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
        appBarTheme: AppBarTheme(
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
