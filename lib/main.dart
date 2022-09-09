import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:linkedin_iam_rich/widgets/header_row.dart';
import 'customCard.dart';
import 'scoreRow.dart';
import 'widgets/neo_text.dart';
import 'statsSection.dart';
import 'sectionTitle.dart';
import 'cardsSection.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

// function to call https://api.spitch.live/contestants?competition_id=6by3h89i2eykc341oz7lv1ddd
Future<String> fetchContestants() async {
  final response = await http.get(Uri.parse(
      'https://api.spitch.live/contestants?competition_id=6by3h89i2eykc341oz7lv1ddd'));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    String data = response.body;
    // convert the data to JSON
    var clubsData = jsonDecode(data)['clubs'][0]['name'];
    print(clubsData);
    return (clubsData);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class MyApp extends StatefulWidget {
  final apiData;
  MyApp({super.key, this.apiData});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future futureApiData;

  @override
  void initState() {
    super.initState();
    futureApiData = fetchContestants();

    print(futureApiData);
  }

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
        body: FutureBuilder(
          future: futureApiData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  HeaderRow(clubName: snapshot.data),
                  const ScoreRow(
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8.0),
                    child: Divider(
                      endIndent: 180.0,
                      indent: 180.0,
                      color: Colors.white,
                    ),
                  ),
                  const ScoreRow(
                    children: [
                      NeoText(
                        text: "🔥Score: 262",
                      ),
                      NeoText(
                        text: "📈Value: 60k",
                      ),
                    ],
                  ),
                  const StatsSection(
                      sectionTitle: SectionTitle(title: "Today\'s Stats"),
                      sectionCards: CardsSection(
                        children: [
                          CustomCard(
                            icon: Icon(
                              Icons.sports_hockey_outlined,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Bochum",
                            subtitle: "Club",
                          ),
                          // card for player position
                          CustomCard(
                            icon: Icon(
                              //age icon
                              Icons.person,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Forward",
                            subtitle: "Position",
                          ),
                          // card for player age
                          CustomCard(
                            icon: Icon(
                              Icons.sports_soccer,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "33",
                            subtitle: "Age",
                          ),
                        ],
                      )),
                  const StatsSection(
                      sectionTitle: SectionTitle(title: "Overall Stats"),
                      sectionCards: CardsSection(
                        children: [
                          CustomCard(
                            icon: Icon(
                              Icons.sports_soccer,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Barca",
                            subtitle: "Club",
                          ),
                          // card for player position
                          CustomCard(
                            icon: Icon(
                              Icons.sports_soccer,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Defender",
                            subtitle: "Position",
                          ),
                          // card for player age
                          CustomCard(
                            icon: Icon(
                              Icons.sports_soccer,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "40",
                            subtitle: "Age",
                          ),
                        ],
                      )),
                  const StatsSection(
                      sectionTitle: SectionTitle(title: "Club Stats"),
                      sectionCards: CardsSection(
                        children: [
                          CustomCard(
                            icon: Icon(
                              Icons.sports_hockey_outlined,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Bochum",
                            subtitle: "Club",
                          ),
                          // card for player position
                          CustomCard(
                            icon: Icon(
                              Icons.sports_soccer,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Forward",
                            subtitle: "Position",
                          ),
                          // card for player age
                          CustomCard(
                            icon: Icon(
                              Icons.sports_soccer,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "33",
                            subtitle: "Age",
                          ),
                        ],
                      )),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
