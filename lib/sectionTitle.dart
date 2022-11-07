import 'package:flutter/material.dart';
import 'package:linkedin_iam_rich/providers/model_theme.dart';
import 'package:provider/provider.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(builder: (_, themeNotifier, __) {
      return (Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: themeNotifier.isDark ? Colors.white : Colors.black,
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
              icon: Icon(Icons.arrow_forward_ios,
                  color: themeNotifier.isDark ? Colors.white : Colors.black,
                  size: 15.0),
            )
          ],
        ),
      ));
    });
  }
}
