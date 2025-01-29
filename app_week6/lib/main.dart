import 'package:app_week6/Home_page.dart';
import 'package:app_week6/display_page.dart';
import 'package:app_week6/login_page.dart';
import 'package:app_week6/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:app_week6/listview.dart';
import 'package:app_week6/my_futurebuilder_page.dart';
import 'package:app_week6/http.dart';

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

      initialRoute: '/my_futurebuilder_page',

      routes: {
        '/http': (context) => const Http(),
        '/my_futurebuilder_page': (context) => const MyFutureBuilderPage(),
        '/listview': (context) =>  const Listview(),
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
        '/display': (context) => const DisplayPage(),
        '/login': (context) => const LoginPage(),
      },

      // home: WelcomePage(),

    );
  }
}