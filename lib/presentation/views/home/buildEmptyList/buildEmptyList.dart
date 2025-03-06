import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/strings.dart';

Widget buildEmptyList(BuildContext context) {
  return Center(
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(height: 20),
            Text(
              AppStrings.listaTransacoesVazia,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            Container(
              height: constraints.maxHeight * 0.6,
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
            ),
          ],
        );
      },
    ),
  );
}
