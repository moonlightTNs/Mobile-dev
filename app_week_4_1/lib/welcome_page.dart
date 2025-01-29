import 'package:flutter/material.dart';
import 'package:app_week_4_1/about_page.dart';
import 'package:app_week_4_1/display_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WelcomePage> {
  // set default value
  // String _message1 = 'HOHIYO';
  final name = TextEditingController();
  final age = TextEditingController();

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
      body: Column(
        children: [
          const Center(
            child: Text(
              'Welcome to Homepage',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          // Text(
          //   ' $_message1 ',
          //   style: const TextStyle(fontSize: 25),
          // ),
          const SizedBox(height: 40),
          TextField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your name',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: age,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your age',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DisplayPage(name: name.text, age: int.parse(age.text))));
              // String input1 = name.text;
              // String input2 = age.text;
              // setState(() {
              //   message1 = 'My name is $input1 $input2';
              // });
            },
            child: const Text('Submit'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
            child: const Text('GO TO ABOUT PAGE'),
          ),

         
          
        ],
      ),
    );
  }
}
