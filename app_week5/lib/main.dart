import 'package:app_week5/Home_page.dart';
import 'package:app_week5/display_page.dart';
import 'package:app_week5/login_page.dart';
import 'package:app_week5/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EV Car Info',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const CarDetailsPage(),
    );
  }
}

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/welcome',

      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
        '/display': (context) => const DisplayPage(),
        '/login': (context) => const LoginPage(),
      },

      // home: WelcomePage(),

    );
  }
}