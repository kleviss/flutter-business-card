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
Future<List<dynamic>> fetchContestants() async {
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

    return [player, club];
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

// NEXT STEPS:
// 1. Fetch data from API
// 2. Display data in UI
// 3. Navigate to a new screen for Club Info

// create a class to hold the data and put it in a Factory List

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
    print("futureApiData " + futureApiData.toString());
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
        // use data for club and player in the future builder
        body: FutureBuilder(
          future: futureApiData,
          builder: (context, snapshot) {
            // decode data and print in console
            if (snapshot.hasData) {
              print("snap ");
              print(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            if (snapshot.hasData) {
              return ListView(
                children: [
                  HeaderRow(
                    playerAvatar: snapshot.data[0]['avatar_urls']['large'],
                    clubName: snapshot.data[1]['name'],
                    playerName: snapshot.data[0]['first_name'],
                    playerSurname: snapshot.data[0]['last_name'],
                    playerPosition: snapshot.data[0]['position'],
                  ),
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
                        text: '🔥Score: ${snapshot.data[0]['total_score']}',
                      ),
                      NeoText(
                        text: "📈Value: ${snapshot.data[0]['market_value']}¢",
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
                            title: snapshot.data[1]['short_name'],
                            subtitle: "Klub",
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
                            subtitle: "Nationalität",
                          ),
                          // card for player position
                          const CustomCard(
                            icon: Icon(
                              // icon for player strong foot
                              Icons.sports_soccer_outlined,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Rechts",
                            subtitle: "Starker Fuß",
                          ),
                          // card for player position
                          const CustomCard(
                            icon: Icon(
                              // icon for player number
                              Icons.confirmation_num,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "1",
                            subtitle: "Trikotnummer",
                          ),
                          // card for player age
                          const CustomCard(
                            icon: Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "33",
                            subtitle: "Alter",
                          ),
                          // card for player age
                          const CustomCard(
                            icon: Icon(
                              Icons.boy,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "193 cm",
                            subtitle: "Größe",
                          ),
                        ],
                      )),
                  const StatsSection(
                      sectionTitle: SectionTitle(title: "Matchday Stats"),
                      sectionCards: CardsSection(
                        children: [
                          CustomCard(
                            icon: Icon(
                              Icons.sports_soccer_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Bochum",
                            subtitle: "Versus",
                          ),
                          CustomCard(
                            icon: Icon(
                              Icons.scoreboard_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Win",
                            subtitle: "Result",
                          ),
                          CustomCard(
                            icon: Icon(
                              Icons.nordic_walking_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Injured",
                            subtitle: "Condition",
                          ),
                          // card for player position
                          CustomCard(
                            icon: Icon(
                              Icons.weekend_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Bench",
                            subtitle: "Lineup",
                          ),
                          // card for player age
                          CustomCard(
                            icon: Icon(
                              Icons.local_fire_department_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "-6",
                            subtitle: "Trend",
                          ),
                          CustomCard(
                            icon: Icon(
                              Icons.do_not_touch_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "0",
                            subtitle: "Saves",
                          ),
                          CustomCard(
                            icon: Icon(
                              Icons.sports_soccer_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Schalke 04",
                            subtitle: "Next Match",
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
                    ),
                  ),
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
