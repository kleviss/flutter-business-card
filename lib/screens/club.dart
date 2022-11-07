import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: const Center(
          child: Text('Club Page'),
        ),
      ),
    );
  }
}
