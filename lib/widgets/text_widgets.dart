import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final alignment;

  const HeaderText(this.text, {this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
      ),
      textAlign: alignment,
    );
  }
}
