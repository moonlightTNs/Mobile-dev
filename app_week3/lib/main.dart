import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/EV logo.png',width: 70, ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {
                debugPrint('Search');
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                debugPrint('More');
              },
            ),
          ],
        ),
        body: Padding(
          padding:  const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Neta v ev car Clear Sky Gray',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/cargray.png',width: 300,),
                const SizedBox(
                  height: 20,
                ),
              
             const Card(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // จัดกึ่งกลางในแนวนอน
      children: [
         ListTile(
          title: Center(
            child: Text(
              'Current SOC %',
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: Center(
            child: Text(
              '50 %',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              'Target SOC %',
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: Center(
            child: Text(
              '--------',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              'Chring rate (kWr)',
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: Center(
            child: Text(
              '50 %',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              'Voltage (V)',
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: Center(
            child: Text(
              '225',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              'Charge Power (kWh)',
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: Center(
            child: Text(
              '4.1400',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  ),
)
                ],
            )
          ),
        ),
      ),
    );
  }
}
