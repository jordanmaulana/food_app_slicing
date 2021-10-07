import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final alignment;
  final maxLine;

  const HeaderText(this.text, {this.alignment, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        // fontFamily: 'DM Sans'
      ),
      textAlign: alignment,
      maxLines: maxLine,
    );
  }
}
