import 'package:flutter/material.dart';
import 'widgets/neo_text.dart';

class ScoreRow extends StatelessWidget {
  final List<Widget> children;

  const ScoreRow({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
      // add the children here
    ));
  }
}
