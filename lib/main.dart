import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_app/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shoe App",
      theme: ThemeData(
        // fontFamily: GoogleFonts.lato().fontFamily,
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 204, 1, 1),
          primary: const Color.fromRGBO(254, 204, 1, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.w700),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      home: const HomePage(),
    );
  }
}
