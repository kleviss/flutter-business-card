import 'package:flutter/material.dart';
import 'package:linkedin_iam_rich/widgets/header_row.dart';
import 'customCard.dart';
import 'scoreRow.dart';
import 'widgets/neo_text.dart';
import 'statsSection.dart';
import 'sectionTitle.dart';
import 'cardsSection.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Player Detail Page',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color(0xFF1DB954),
        ),
        backgroundColor: Colors.black12,
        body: ListView(
          children: const [
            HeaderRow(),
            ScoreRow(
              children: [
                NeoText(
                  text: "⚽️Goals: 2",
                ),
                NeoText(
                  text: "🅰️Assists: 6",
                ),
                NeoText(
                  text: "🧤Saves: 26",
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
              child: Divider(
                endIndent: 180.0,
                indent: 180.0,
                color: Colors.white,
              ),
            ),
            ScoreRow(
              children: [
                NeoText(
                  text: "🔥Score: 262",
                ),
                NeoText(
                  text: "📈Value: 60k",
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
              child: Divider(
                endIndent: 180.0,
                indent: 180.0,
                color: Colors.white,
              ),
            ),
            StatsSection(
                sectionTitle: SectionTitle(title: "Today\'s Stats"),
                sectionCards: CardsSection()),
            StatsSection(
                sectionTitle: SectionTitle(title: "Overall Stats"),
                sectionCards: CardsSection()),
            StatsSection(
                sectionTitle: SectionTitle(title: "Club Stats"),
                sectionCards: CardsSection()),
          ],
        ),
      ),
    );
  }
}
