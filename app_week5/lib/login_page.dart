import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.age, this.name});
  final int? age;
  final String? name;

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final int? age = args['age'];
    final String? name = args['name'];

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
              'Login Page',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'name : $name ',
            style: const TextStyle(fontSize: 25),
          ),
          Text(
            'age : $age ',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 30),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/welcome');
          //   },
          //   child: const Text('Back to Welcome Page'),
          // ),
          const Text(
            'Login Successful',
            style: TextStyle(
              fontSize: 25,
              color: Colors.red, // color red
            ),
          ),
        ],
      ),
    );
  }
}
