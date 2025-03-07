import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String tituloBotao;
  final Color? backgroundColor;
  final Color? foregroundColor;

  CustomFlatButton({
    required this.onPressed,
    required this.tituloBotao,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
          child: Text(tituloBotao),
          onPressed: onPressed,
          color: backgroundColor ?? Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor:
                    backgroundColor ?? Theme.of(context).primaryColor,
                foregroundColor: foregroundColor ?? Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                style: TextStyle(fontWeight: FontWeight.bold),
                tituloBotao,
              ),
            ),
          ],
        );
  }
}
