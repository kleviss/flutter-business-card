import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_iam_rich/providers/model_theme.dart';
import 'package:provider/provider.dart';

@immutable
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (_, themeNotifier, __) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF1DB954),
        ),
        body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                SwitchListTile(
                  title: const Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: themeNotifier.isDark,
                  onChanged: (val) {
                    themeNotifier.isDark = val;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
