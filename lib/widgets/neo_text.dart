import 'package:flutter/material.dart';
import 'package:linkedin_iam_rich/providers/model_theme.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ModelTheme>(
      builder: (_, themeNotifier, __) {
        return Text(
          text,
          style: TextStyle(
            color: themeNotifier.isDark ? Colors.white : Colors.black,
            fontSize: fontSize,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        );
      },
    );
  }
}
