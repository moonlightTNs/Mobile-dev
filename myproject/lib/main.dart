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
        scaffoldBackgroundColor: const Color.fromARGB(255, 211, 231, 219),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 3, 102, 53),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo.png', width: 200),
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
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(children: <Widget>[
              const SizedBox(height: 20),
              Image.network(
                'https://www.popticles.com/wp-content/uploads/2023/12/Starbucks_Corporation_Logo_2011.png',
                width: 150,
              ),
              const SizedBox(height: 20),
              const Text('ขอบคุณที่ใช้บริการ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold)),
              const Text(
                  'เรายินดีที่ได้เป็นส่วนหนึ่งในการดื่มกาแฟของคุณในทุกๆ เวลา ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.normal)),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('สรุปรายละเอียด',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_cafe, size: 35),
                      Text(' กาแฟร้อน 1 แก้ว',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                  Text('50 บาท',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal)),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bakery_dining, size: 35),
                      Text('ขนมปัง 1 ชิ้น',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                  Text('40 บาท',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal)),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('รวมราคาสินค้า',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text('90 บาท',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('ต้นทาง ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text('บิ๊กซี วงศ์สว่าง',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal)),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('ปลายทาง ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text('มหาวิทยาลัยพระจอมเกล้าพระนครเหนือ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal)),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  debugPrint('OK Check it!!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 3, 102, 53), // Set the button's background color
                  foregroundColor: Colors
                      .white, // Set the color of the child widget (e.g., icon or text)
                ),
                child: const Icon(
                  Icons.check,
                  size: 50,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}










        // body: Center(
        //   child: Column(
        //     children: <Widget>[
        //       const Text('Hello, World!',
        //           style: TextStyle(
        //               fontSize: 30,
        //               color: Color.fromARGB(255, 255, 0, 0),
        //               fontWeight: FontWeight.bold)),
        //       const SizedBox(height: 20),
        //       Image.network(
        //         'https://images.pexels.com/photos/1379636/pexels-photo-1379636.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //         width: 200,
        //       ),
        //       const SizedBox(height: 20),
        //       Image.asset(
        //         'assets/images/Nature.jpg',
        //         width: 100,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           IconButton(
        //               onPressed: () {
        //                 debugPrint('I Like it!!');
        //               },
        //               icon: const Icon(
        //                 Icons.favorite,
        //                 size: 50,
        //               )),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     debugPrint('HII');
                  //   },
                  //   child: const Text("Press me",
                  //       style: TextStyle(
                  //           fontSize: 20,
                  //           color: Color.fromARGB(255, 0, 51, 255))),
                  // ),
        //           IconButton(
        //               onPressed: () {
        //                 debugPrint('EYE');
        //               },
        //               icon: const Icon(
        //                 Icons.remove_red_eye,
        //                 size: 50,
        //               )),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
  
