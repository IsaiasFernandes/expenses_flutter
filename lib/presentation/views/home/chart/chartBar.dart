import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/CardUtils.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(formatValue(value))),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              width: 10,
              height: constraints.maxHeight * 0.6,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(220, 220, 220, 1),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container( height: constraints.maxHeight * 0.15, child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
