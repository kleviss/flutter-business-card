import 'package:flutter/material.dart';

class NeoText extends StatelessWidget {
  final String text;
  final double fontSize;

  const NeoText({
    super.key,
    required this.text,
    this.fontSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
        fontFamily: 'Lato',
      ),
    );
  }
}
