import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipebook/screens/tabscreen.dart';

void main() {
  runApp(
    const ProviderScope(child: App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 131, 57, 0),
        ),
        // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const TabScreens(),
    );
  }
}
