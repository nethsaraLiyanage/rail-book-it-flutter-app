import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:railway/screens/landing_screen.dart';

final theme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.rajdhaniTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
    ));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
