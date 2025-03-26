
import 'package:flutter/material.dart';
import 'package:app_week7/listview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Listviewpage(),
    );
  }
}


