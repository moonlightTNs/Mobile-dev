import 'package:flutter/material.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Listview> {
  final List<String> items = <String>[
    'Tesla Model S',
    'Tesla Model 3',
    'Tesla Model X',
  ];
  @override
  Widget build(BuildContext context) {
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
      //_______________________________________________________________________
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(items[index]),
        ), 
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
