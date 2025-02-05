import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key, this.name, this.age});
  final String? name;
  final int? age;

  @override
  State<DisplayPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String? name = args['name'];
    final int? age = args['age'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/EV logo.png',
          width: 70,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Display Page',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            ' name : $name ',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 10),
          Text(
            ' age : $age ',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back to Welcome Page'),
          ),
        ],
      ),
    );
  }
}