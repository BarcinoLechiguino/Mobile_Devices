import 'package:flutter/material.dart';

import 'screens/color_match_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Match',
      debugShowCheckedModeBanner: false,
      home: ColorMatchScreen(),
    );
  }
}
