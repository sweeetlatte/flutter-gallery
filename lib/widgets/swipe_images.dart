import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

class SwipeImages extends StatelessWidget {
  const SwipeImages({Key? key, required this.images}) : super(key: key);

  final images;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: 300,
      itemHeight: 550,
      itemCount: images.length,
      itemBuilder: (BuildContext context, index) {
        return GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: const Icon(Icons.favorite_border_sharp, size: 32),
            title: Text(
              images[index].name,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          child: Image.asset(
            images[index].image,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
