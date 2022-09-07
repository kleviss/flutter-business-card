import 'package:flutter/material.dart';
import 'customCard.dart';
import 'scoreRow.dart';
import 'widgets/neo_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/klevis.jpeg'),
                      ),
                      NeoText(text: "BVB"),
                      Text(
                        'Neuer, M.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                      Chip(
                        label: Text('Goalkeeper'),
                        padding: EdgeInsets.all(8.0),
                        visualDensity: VisualDensity.compact,
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Color(0xFF1DB954),
                            width: 1.0,
                          ),
                        ),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.sports_soccer,
                            color: Colors.white,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                      SizedBox(
                        height: 0.0,
                        width: 50.0,
                        // child: Divider(
                        //   color: Colors.white,
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ScoreRow(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
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
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                endIndent: 180.0,
                indent: 180.0,
                color: Colors.white,
              ),
            ),
            ScoreRow(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  NeoText(
                    text: "🔥Score: 262",
                  ),
                  NeoText(
                    text: "📈Value: 60k",
                  ),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 38.0, 8.0, 0.0),
                child: Text(
                  'Today\'s Stats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Lato',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 18.0, 4.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomCard(),
                  CustomCard(),
                  CustomCard(),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 18.0, 8.0, 18.0),
                child: Text(
                  'Overall Stats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Lato',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomCard(),
                  CustomCard(),
                  CustomCard(),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 18.0, 8.0, 18.0),
                child: Text(
                  'Overall Stats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Lato',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomCard(),
                  CustomCard(),
                  CustomCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
