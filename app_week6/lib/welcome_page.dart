import 'package:app_week6/home_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WelcomePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Welcome Page',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 40),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your age',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                int age = int.parse(ageController.text);
                
                Navigator.pushNamed(
                  context,
                  '/display',
                  arguments: {'name': name, 'age': age},
                );
              },
              child: const Text('SUBMIT'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('GO TO HOME PAGE'),
            ),
            ElevatedButton(
              onPressed: () {Navigator.pushReplacementNamed(
                  context,
                  '/listview',
                  arguments: {},
                );
                
              },
              child: const Text('GO TO LISTVIEW PAGE'),
            ),
             ElevatedButton(
              onPressed: () {Navigator.pushReplacementNamed(
                  context,
                  '/my_futurebuilder_page',
                  arguments: {},
                );
                
              },
              child: const Text('GO TO FUTURE BUILDER PAGE'),
            ),
            ElevatedButton(
              onPressed: () {
                int age = int.parse(ageController.text);
                String name = nameController.text;
                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                  arguments: {'age': age , 'name': name},
                );
              },
              child: const Text('GO TO LOGIN PAGE'),
            )
            
          ],
        ),
      ),
    );
  }
}
