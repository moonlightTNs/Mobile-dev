import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product.dart';

Future<Product> fetchByID({required String strUrl}) async {
  final response = await http.get(Uri.parse(strUrl));
  if (response.statusCode == 200) {
    final resJson = json.decode(response.body);
    //ตรงนี้จะไม่มี .map เพราะเป็น product อันเดียวแปลงตรงๆได้เลย
    return Product.fromJson(resJson);
  } else {
    throw Exception("Error");
  }
}

class DetailPage extends StatefulWidget {
  final int productId;

  const DetailPage({super.key, required this.productId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  static const String baseUrl = 'https://itpart.net/mobile/api/'; // API json
  String baseImgUrl = 'https://itpart.net/mobile/images/'; // base Image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("ListView",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // Center the ProductCard
          child: FutureBuilder(
            future:
                fetchByID(strUrl: '${baseUrl}product${widget.productId}.php'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // until data is fetched, show loader
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}',
                    style: const TextStyle(fontSize: 18));
              } else if (snapshot.hasData) {
                return ProductCard(
                  title: snapshot.data!.title,
                  imageUrl: '$baseImgUrl${snapshot.data!.imageUrl}',
                  description: snapshot.data!.description,
                );
              }
              return const Text('No data available!');
            },
          ),
        ),
      ),
    );
  }
}

// Define the ProductCard widget
class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const ProductCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
