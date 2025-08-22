import 'package:flutter/material.dart';
import 'profile_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data to show the design
    final Map<String, dynamic> userInfo = {
      'username': 'ger_test',
      'active_cons': 2,
      'max_connections': 5,
      'exp_date': '1755609600', // A test timestamp
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: ProfileSelectionScreen(userInfo: userInfo),
    );
  }
}