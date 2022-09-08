import 'package:flutter/material.dart';
import 'widgets/neo_text.dart';
import 'customCard.dart';

class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return (Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 4.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomCard(),
          CustomCard(),
          CustomCard(),
        ],
      ),
    ));
  }
}
