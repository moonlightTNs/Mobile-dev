import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WelcomePage> {
  // set default value 
  String _message1 = 'HOHIYO ';
  final _name = TextEditingController(); 
  final _surname = TextEditingController(); 
  
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
            child: 
            Text(
              'Welcome to Homepage',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              
            ),
          ),
          const SizedBox(height: 20), 

          Text(
            ' $_message1 ',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 40),
          TextField(
            controller:_name ,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              
              labelText: 'Enter your name',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller:_surname ,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              
              labelText: 'Enter your surname',
            ),
          ),
          const SizedBox(height: 20),
           ElevatedButton(
            onPressed: () {
              String input1 = _name.text;
              String input2 = _surname.text;
              setState(() {
                _message1 = 'My name is $input1 $input2';
              });
            },
            child: const Text('Submit'),
          ),


          ElevatedButton(
            onPressed: () {
              setState(() {
                _message1 = 'Hello';
              });
            },
            child: const Text('BT1'),
          ),


          ElevatedButton(
            onPressed: () {
              setState(() {
                _message1 = 'สวัสดี';
              });
            },
            child: const Text('BT2'),
          ),

        ],
      ),
    );
  }
}
