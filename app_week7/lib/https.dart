import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future  fetchData() async {
    final response =
      await http.get(Uri.parse('https://itpart.net/mobile/api/products.php'));

      if(response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        //  String  strBody = response.body.toString();
        return jsonBody;
      } else {
        throw Exception('Failed to load data');
      }
  }
//---------------------------------------------------------------------
class Https extends StatefulWidget {
  const Https({super.key});
  
  @override
  State<Https> createState() => _MyFutureBuilderPageState();
}

class _MyFutureBuilderPageState extends State<Https> {
  // Simulating an asynchronous operation that returns a Future

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("HTTPS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
        body: Center(
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Result: ${snapshot.data}',
                    style: const TextStyle(fontSize: 20));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
