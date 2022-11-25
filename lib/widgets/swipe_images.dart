import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:gallery/modal/item_modal.dart';
import 'package:gallery/providers/image_provider.dart';
import 'package:provider/provider.dart';

class SwipeImages extends StatelessWidget {
  const SwipeImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = Provider.of<MyImageProvider>(context).images;

    return Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: 300,
      itemHeight: 550,
      itemCount: images.length,
      itemBuilder: (BuildContext context, index) {
        return ChangeNotifierProvider.value(
          value: images[index],
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              leading: Consumer<MyImage>(
                builder: (context, image, child) {
                  return InkWell(
                      onTap: () {
                        image.toggleIsFavorite();
                      },
                      child: Icon(
                          image.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_sharp,
                          size: 32));
                },
              ),
              title: Text(
                images[index].name,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
            child: Image.asset(
              images[index].image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
