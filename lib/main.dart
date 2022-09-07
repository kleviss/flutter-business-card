import 'package:flutter/material.dart';
import 'customCard.dart';

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
                      Text(
                        'Klevis X.',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Average Score',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Lato',
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  '23',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                    fontFamily: 'Lato',
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  height: 30.0,
                  child: VerticalDivider(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Total Score',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Lato',
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  '145',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 23.0,
                  ),
                  Text(
                    ' Score',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontFamily: 'Lato',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '23',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Lato',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  SizedBox(
                    height: 30.0,
                    child: VerticalDivider(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    ' Score',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontFamily: 'Lato',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '145',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 18.0, 8.0, 0.0),
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
          ],
        ),
      ),
    );
  }
}
