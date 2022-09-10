import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Club extends StatelessWidget {
  const Club({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Mateial app with app bar
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Club'),
        ),
        body: const Center(
          child: Text('Club'),
        ),
      ),
    );
  }
}
