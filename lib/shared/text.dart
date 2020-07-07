import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  ResponsiveText(
    this.text, {
    this.style,
    this.align,
  });

  final String text;
  final TextStyle style;
  final TextAlign align;

  @override
  Widget build(BuildContext context) => FittedBox(
        child: Text(text, style: style, textAlign: align),
      );
}
