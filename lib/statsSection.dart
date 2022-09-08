import 'package:flutter/material.dart';
import 'widgets/neo_text.dart';
import 'customCard.dart';

class StatsSection extends StatelessWidget {
  final Widget sectionTitle;
  final Widget sectionCards;

  const StatsSection(
      {super.key, required this.sectionTitle, required this.sectionCards});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return (Column(
      children: [
        sectionTitle,
        sectionCards,
      ],
    ));
  }
}
