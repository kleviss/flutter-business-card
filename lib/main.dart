import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:linkedin_iam_rich/widgets/header_row.dart';
import 'package:linkedin_iam_rich/widgets/image_card.dart';
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
                          ImageCard(
                            hasNetworkImage: true,
                            hasTouchEvent: true,
                            clubData: [
                              snapshot.data[0]['first_name'],
                              snapshot.data[0]['last_name'],
                              snapshot.data[0]['position'],
                              snapshot.data[0]['total_score'],
                              snapshot.data[0]['market_value'],
                              snapshot.data[0]['avatar_urls']['large'],
                              snapshot.data[1]['name'],
                            ],
                            imageUrl: snapshot.data[1]['logo'],
                            title: snapshot.data[1]['short_name'],
                            subtitle: "Klub",
                          ),
                          // card for player position
                          const ImageCard(
                              hasNetworkImage: true,
                              hasTouchEvent: false,
                              imageUrl: "https://i.imgur.com/O69b7nw.jpg",
                              title: "Germany",
                              subtitle: "Nationalität"),
                          // card for player position
                          const CustomCard(
                            cardIcon: Icon(
                              // cardIcon for player strong foot
                              Icons.sports_soccer_outlined,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Rechts",
                            subtitle: "Starker Fuß",
                          ),
                          // card for player position
                          ImageCard(
                              hasNetworkImage: true,
                              imageUrl: snapshot.data[1]['jersey_url'],
                              title:
                                  snapshot.data[0]['jersey_number'].toString(),
                              subtitle: "Trikotnummer"),
                          // card for player age
                          const CustomCard(
                            cardIcon: Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "33",
                            subtitle: "Alter",
                          ),
                          // card for player age
                          const CustomCard(
                            cardIcon: Icon(
                              Icons.boy,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "193 cm",
                            subtitle: "Größe",
                          ),
                        ],
                      )),
                  StatsSection(
                      sectionTitle: const SectionTitle(title: "Matchday Stats"),
                      sectionCards: CardsSection(
                        children: [
                          const CustomCard(
                            cardIcon: Icon(
                              Icons.sports_soccer_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Bochum",
                            subtitle: "Versus",
                          ),
                          const CustomCard(
                            cardIcon: Icon(
                              Icons.scoreboard_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Win",
                            subtitle: "Result",
                          ),
                          CustomCard(
                            cardIcon: snapshot.data[0]['injured'] == true
                                ? const Icon(
                                    Icons.nordic_walking_rounded,
                                    color: Colors.black,
                                    size: 40.0,
                                  )
                                : const Icon(
                                    Icons.health_and_safety,
                                    color: Colors.green,
                                    size: 40.0,
                                  ),
                            title: snapshot.data[0]['injured'] == true
                                ? "Injured"
                                : "Healthy",
                            subtitle: "Condition",
                          ),
                          // card for player position
                          const CustomCard(
                            cardIcon: Icon(
                              Icons.weekend_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Bench",
                            subtitle: "Lineup",
                          ),
                          // card for player age
                          const CustomCard(
                            cardIcon: Icon(
                              Icons.local_fire_department_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "-6",
                            subtitle: "Trend",
                          ),
                          const CustomCard(
                            cardIcon: Icon(
                              Icons.do_not_touch_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "0",
                            subtitle: "Saves",
                          ),
                          const CustomCard(
                            cardIcon: Icon(
                              Icons.sports_soccer_rounded,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: "Schalke 04",
                            subtitle: "Next Match",
                          ),
                        ],
                      )),
                  StatsSection(
                    sectionTitle: const SectionTitle(title: "Club Stats"),
                    sectionCards: CardsSection(
                      children: [
                        ImageCard(
                            hasNetworkImage: true,
                            imageUrl: snapshot.data[1]['jersey_url'],
                            title: snapshot.data[1]['abbreviation'],
                            subtitle: "Jersey"),
                        // card for player position
                        const CustomCard(
                          cardIcon: Icon(
                            Icons.table_rows_rounded,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          title: "2nd",
                          subtitle: "Ranking",
                        ),
                        // card for player age
                        const CustomCard(
                          cardIcon: Icon(
                            Icons.stacked_bar_chart_rounded,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          title: "33",
                          subtitle: "Streak",
                        ),
                        const CustomCard(
                          cardIcon: Icon(
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

class Club extends StatelessWidget {
  const Club({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Mateial app with app bar
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Club Page',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color(0xFF1DB954),
        ),
        body: const Center(
          child: Text('Club Page'),
        ),
      ),
    );
  }
}
