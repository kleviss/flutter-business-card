import 'package:flutter/material.dart';
import 'widgets/neo_text.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                fontFamily: 'Alto',
              ),
            ),
            IconButton(
                onPressed: () {
                  null;
                },
                tooltip: "View today's stats",
                splashColor: Colors.green.shade400,
                splashRadius: 25.0,
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)),
          ],
        )));
  }
}
