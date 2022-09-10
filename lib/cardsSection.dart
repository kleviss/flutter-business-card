import 'package:flutter/material.dart';
import 'widgets/neo_text.dart';
import 'customCard.dart';

class CardsSection extends StatelessWidget {
  final List<Widget> children;

  const CardsSection({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return (SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 4.0, 10.0),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    ));
  }
}
