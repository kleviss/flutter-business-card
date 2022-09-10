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

const String URL =
    'https://api.spitch.live/contestants?competition_id=6by3h89i2eykc341oz7lv1ddd';

// function to call https://api.spitch.live/contestants?competition_id=6by3h89i2eykc341oz7lv1ddd
Future<PlayerInfo> fetchContestants() async {
  final response = await http.get(Uri.parse(URL));

  if (response.statusCode == 200) {
    String data = response.body;

    var playerData = jsonDecode(data)['players'];
    var player = playerData.firstWhere(
        (element) => element['id'] == 'a8e69669-b4bb-5cb3-9bec-7d860fc080b1');
    print(player);

    var clubData = jsonDecode(data)['clubs'];
    var club =
        clubData.firstWhere((element) => element['id'] == player['club_id']);
    print(club);
    ;

    return PlayerInfo.fromJson(player);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

// So, I am successfully getting the data that I want,
// as I can see from the print methods, but I want to
// return both playerData and clubData so I can use this
// information later on FutureBuilder widget.
// I am not sure how to do this, as I am new to Dart and Flutter.

// create a class to hold the data and put it in a Factory List
class PlayerInfo {
  final String name;
  final String surname;
  final String id;
  final String clubId;
  final String position;
  final int jerseyNumber;
  final String image;
  final int totalScore;
  final int avgScore;

  PlayerInfo(
      {required this.name,
      required this.surname,
      required this.id,
      required this.clubId,
      required this.position,
      required this.jerseyNumber,
      required this.image,
      required this.totalScore,
      required this.avgScore});

  factory PlayerInfo.fromJson(Map<String, dynamic> json) {
    return PlayerInfo(
      name: json['first_name'],
      surname: json['last_name'],
      id: json['id'],
      clubId: json['club_id'],
      position: json['position'],
      jerseyNumber: json['jersey_number'],
      image: json['avatar_urls']['large'],
      totalScore: json['total_score'],
      avgScore: json['avg_score'],
    );
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
                  HeaderRow(
                      playerAvatar: snapshot.data!.image,
                      clubName:
                          snapshot.data!.clubId.toString().substring(0, 8),
                      playerName: snapshot.data!.name,
                      playerSurname: snapshot.data!.surname,
                      playerPosition: snapshot.data!.position),
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
                  ScoreRow(
                    children: [
                      NeoText(
                        text: '🔥Score: ${snapshot.data!.totalScore}',
                      ),
                      NeoText(
                        text: "📈Value: ${snapshot.data!.avgScore}¢",
                      ),
                    ],
                  ),
                  StatsSection(
                      sectionTitle: const SectionTitle(title: "Player\'s Info"),
                      sectionCards: CardsSection(
                        children: [
                          CustomCard(
                            icon: const Icon(
                              Icons.sports_hockey_outlined,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: snapshot.data!.clubId
                                .toString()
                                .substring(0, 5),
                            subtitle: "Club",
                          ),
                          // card for player position
                          const CustomCard(
                            icon: Icon(
                              //age icon
                              Icons.map_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Germany",
                            subtitle: "Country",
                          ),
                          // card for player position
                          const CustomCard(
                            icon: Icon(
                              //age icon
                              Icons.map_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Germany",
                            subtitle: "Country",
                          ),
                          // card for player age
                          const CustomCard(
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
                      sectionTitle: SectionTitle(title: "Matchday Stats"),
                      sectionCards: CardsSection(
                        children: [
                          CustomCard(
                            icon: Icon(
                              Icons.healing,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Injured",
                            subtitle: "Condition",
                          ),
                          // card for player position
                          CustomCard(
                            icon: Icon(
                              Icons.event_seat_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Bench",
                            subtitle: "Lineup",
                          ),
                          // card for player age
                          CustomCard(
                            icon: Icon(
                              Icons.show_chart_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "40",
                            subtitle: "Trend",
                          ),
                          CustomCard(
                            icon: Icon(
                              Icons.show_chart_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "40",
                            subtitle: "Trend",
                          ),
                        ],
                      )),
                  const StatsSection(
                      sectionTitle: SectionTitle(title: "Club Stats"),
                      sectionCards: CardsSection(
                        children: [
                          CustomCard(
                            // add club icon here
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
                              Icons.table_rows_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "2nd",
                            subtitle: "Ranking",
                          ),
                          // card for player age
                          CustomCard(
                            icon: Icon(
                              Icons.stacked_bar_chart_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "33",
                            subtitle: "Streak",
                          ),
                          CustomCard(
                            icon: Icon(
                              Icons.show_chart_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "40",
                            subtitle: "Trend",
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
