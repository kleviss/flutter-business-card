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
Future<PlayerInfo> fetchContestants() async {
  final response = await http.get(Uri.parse(
      'https://api.spitch.live/contestants?competition_id=6by3h89i2eykc341oz7lv1ddd'));

  if (response.statusCode == 200) {
    // find a player in th response whose id is a8e69669-b4bb-5cb3-9bec-7d860fc080b1
    // If the call to the server was successful, parse the JSON
    String data = response.body;
    var playerData = jsonDecode(data)['players'];

    // find a player in the response whose id is a8e69669-b4bb-5cb3-9bec-7d860fc080b1
    var player = playerData.firstWhere(
        (element) => element['id'] == 'a8e69669-b4bb-5cb3-9bec-7d860fc080b1');

    print(player);

    var clubData = jsonDecode(data)['clubs'];

    // find a club whose id is equal to the club_id of the player
    var club =
        clubData.firstWhere((element) => element['id'] == player['club_id']);

    print(club['abbreviation']);

    return PlayerInfo.fromJson(player);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

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
                      playerAvatar: snapshot.data.image,
                      clubName: snapshot.data!.clubId,
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
