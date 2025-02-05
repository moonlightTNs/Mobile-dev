import 'dart:convert';

import 'package:app_week7/detail_page.dart';
import 'package:app_week7/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Listview> {
static const String baseUrl = 'https://itpart.net/mobile/api/'; // API json
  String baseImgUrl = 'https://itpart.net/mobile/images/'; // base Image URL

  Future<List<Product>> fetchData() async {
    final response = await http.get(Uri.parse('${baseUrl}products.php'));
    if (response.statusCode == 200) {
      List<dynamic> responseJson = json.decode(response.body);
      return responseJson.map((m) => Product.fromJson(m)).toList();
    } else {
      throw Exception('error fetching data');
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("ListView", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
      //______________________________________________________________________________________
      
      body: FutureBuilder(future: fetchData(), builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Product>? products = snapshot.data;
          return  listviewshow(products!); 
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      }),
    );
  }

  ListView listviewshow(List<Product> products) {
    return ListView.separated(itemBuilder: (context,index){
          return ListTile(
            onTap:(){
             Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(productId: products[index].id)));
            } ,
            leading: Image.network(
              '$baseImgUrl/${products[index].imageUrl}',
              width: 86,
            ),
            title: Text(products[index].title, style: const TextStyle(fontSize: 18)),
            subtitle: Text(products[index].description),
          );
        }, separatorBuilder: (context,index) => const Divider(), itemCount: products.length);
  }
}
