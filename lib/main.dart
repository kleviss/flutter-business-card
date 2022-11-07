import 'package:flutter/material.dart';
import 'package:linkedin_iam_rich/providers/model_theme.dart';
import 'package:provider/provider.dart';

import 'screens/player_details.dart';
import 'screens/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // Function to change the index of the selected bottom navigation bar item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ModelTheme(),
        child: Consumer<ModelTheme>(builder: (_, themeNotifier, __) {
          return MaterialApp(
            title: 'SPITCH - Detail Page',
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.isDark
                ? ThemeData(
                    brightness: Brightness.dark,
                    primaryColor: Colors.green,
                    primarySwatch: Colors.green)
                : ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Colors.green,
                    primarySwatch: Colors.green),
            home: Scaffold(
              body: Center(
                child: _pages.elementAt(_selectedIndex),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports),
                    label: 'Details',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_brightness_rounded),
                    label: 'Settings',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor:
                    themeNotifier.isDark ? Colors.greenAccent : Colors.green,
                onTap: _onItemTapped,
                backgroundColor:
                    themeNotifier.isDark ? Colors.black : Colors.white,
                selectedFontSize: 16,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }));
  }
}

// List to store the pages of the bottom navigation bar
int _selectedIndex = 0;
final List<Widget> _pages = <Widget>[
  const Center(
    child: PlayerDetailsScreen(),
  ),
  const Center(
    child: SettingsScreen(),
  ),
];
