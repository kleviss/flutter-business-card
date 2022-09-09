import 'package:flutter/material.dart';
import 'neo_text.dart';

class HeaderRow extends StatelessWidget {
  final String playerAvatar;
  final String clubName;
  final String playerName;
  final String playerSurname;
  final String playerPosition;

  const HeaderRow(
      {super.key,
      required this.playerAvatar,
      required this.clubName,
      required this.playerName,
      required this.playerSurname,
      required this.playerPosition});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(playerAvatar),
              ),
              NeoText(text: clubName, fontSize: 10.0),
              Text(
                '$playerName $playerSurname',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontFamily: 'Lato',
                ),
              ),
              Chip(
                label: Text(playerPosition.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10.0,
                    )),
                padding: const EdgeInsets.all(8.0),
                visualDensity: VisualDensity.compact,
                backgroundColor: Colors.white,
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Color(0xFF1DB954),
                    width: 1.0,
                  ),
                ),
                avatar: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.sports_soccer,
                    color: Colors.white,
                  ),
                ),
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(
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
    );
  }
}
