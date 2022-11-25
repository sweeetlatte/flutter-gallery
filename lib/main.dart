import 'package:flutter/material.dart';
import 'package:gallery/modal/item_modal.dart';
import 'package:gallery/widgets/swipe_images.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<MyImage> images = [
    MyImage(id: '1', name: 'Image 01', image: 'assets/images/image1.jpg'),
    MyImage(id: '2', name: 'Image 02', image: 'assets/images/image2.jpg'),
    MyImage(id: '3', name: 'Image 03', image: 'assets/images/image3.jpg'),
    MyImage(id: '4', name: 'Image 04', image: 'assets/images/image4.jpg'),
    MyImage(id: '5', name: 'Image 05', image: 'assets/images/image5.jpg'),
    MyImage(id: '6', name: 'Image 06', image: 'assets/images/image6.jpg'),
    MyImage(id: '7', name: 'Image 07', image: 'assets/images/image7.jpg'),
    MyImage(id: '8', name: 'Image 08', image: 'assets/images/image8.jpg'),
    MyImage(id: '9', name: 'Image 09', image: 'assets/images/image9.jpg'),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010204),
      appBar: AppBar(
        title: const Text('Gallery',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 5)),
        backgroundColor: const Color(0xff010204),
        elevation: 0,
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                    const PopupMenuItem(child: Text('All')),
                    const PopupMenuItem(child: Text('Favorites'))
                  ])
        ],
      ),
      body: SwipeImages(
        images: images,
      ),
    );
  }
}
