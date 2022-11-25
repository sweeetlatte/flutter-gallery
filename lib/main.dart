import 'package:flutter/material.dart';
import 'package:gallery/providers/image_provider.dart';
import 'package:gallery/widgets/swipe_images.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => MyImageProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<MyImageProvider>(context, listen: false).readJson();
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
      body: const SwipeImages(),
    );
  }
}
