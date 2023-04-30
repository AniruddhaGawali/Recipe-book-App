import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipebook/screens/tabscreen.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 131, 57, 0),
          ),
          // textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: TabScreens()),
  );
}
