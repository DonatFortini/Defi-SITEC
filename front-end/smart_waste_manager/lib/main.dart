import 'package:flutter/material.dart';
import 'package:smart_waste_manager/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Waste Manager',
      theme: ThemeData(
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.blue,
          // Nouvelle couleur du fond de la barre
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.red, // Couleur de fond de la BottomNavigationBar
          selectedItemColor: Colors.grey, // Couleur des items sélectionnés

          unselectedItemColor: Colors.black, // Couleur des items non sélectionnés
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent, secondary: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Smart Waste Manager'),
    );
  }
}
