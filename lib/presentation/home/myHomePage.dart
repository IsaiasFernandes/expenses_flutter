import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/transaction.dart';

class MyHomePage extends StatelessWidget {

  final _transactions = [
    Transaction(id: 'T1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(id: 'T2',
        title: 'Conta de Luz',
        value: 211.30,
        date: DateTime.now())
  ]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white, // Define a cor do texto e ícones
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Lista de Transações'),
            )
          ],
        )
    );
  }
}
