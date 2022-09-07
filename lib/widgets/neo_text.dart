import 'package:flutter/material.dart';

class NeoText extends StatelessWidget {
  final String text;

  const NeoText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
        fontFamily: 'Lato',
      ),
    );
  }
}
