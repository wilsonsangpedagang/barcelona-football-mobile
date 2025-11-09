
import 'package:flutter/material.dart';
import 'package:barcelona_football_mobile/screens/menu.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFA50044),     // Maroon red (AppBar)
          secondary: Color(0xFF004D98),   // Deep blue (buttons)
          surface: Colors.white,          // Card or panel surfaces
          background: Color(0xFFFFED02),  // Soft yellow background
          onPrimary: Colors.white,        // Text/icons on maroon
          onSecondary: Colors.white,      // Text/icons on blue
          onSurface: Colors.black,        // Text/icons on white surfaces
        ),
        scaffoldBackgroundColor: Color(0xFFFFED02), // main screen background
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
