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

enum categoryOption { all, favorite }

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    Provider.of<MyImageProvider>(context, listen: false).readJson();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010204),
      appBar: AppBar(
        title: Consumer<MyImageProvider>(
          builder: (context, image, child) {
            return Text(
                isFavorite ? 'Favorites (${image.countFavorites})' : 'Gallery',
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 5));
          },
        ),
        backgroundColor: const Color(0xff010204),
        elevation: 0,
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  if (value == categoryOption.favorite)
                    isFavorite = true;
                  else
                    isFavorite = false;
                });
              },
              icon: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('All'),
                      value: categoryOption.all,
                    ),
                    const PopupMenuItem(
                      child: Text('Favorites'),
                      value: categoryOption.favorite,
                    )
                  ])
        ],
      ),
      body: SwipeImages(
        isFavorite: isFavorite,
      ),
    );
  }
}
