import 'package:flutter/material.dart';

import 'screens/tenis_courts_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Club',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TenisCourtsScreen(),
    );
  }
}
