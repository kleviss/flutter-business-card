import 'package:flutter/material.dart';
import 'neo_text.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: const <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/klevis.jpeg'),
              ),
              NeoText(text: "BVB", fontSize: 10.0),
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
                  fontSize: 12.0,
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
    );
  }
}
