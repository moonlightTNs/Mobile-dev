import 'package:app_week7/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:app_week7/Home_page.dart';
import 'package:app_week7/display_page.dart';
import 'package:app_week7/login_page.dart';
import 'package:app_week7/listview.dart';
import 'package:app_week7/https.dart';

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

      initialRoute: '/listview',

      routes: {
        // '/detail_page': (context) => const DetailPage(),
        '/my_futurebuilder_page': (context) => const Https(),
        '/listview': (context) =>  const Listview(),
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
        '/display': (context) => const DisplayPage(),
        '/login': (context) => const LoginPage(),
      },

      home: const Listview(),

    );
  }
}