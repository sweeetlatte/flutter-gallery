import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/modal/item_modal.dart';

class MyImageProvider extends ChangeNotifier {
  List<MyImage> _images = [];

  List<MyImage> get images {
    return [..._images];
  }

  List<MyImage> showItemFavorite() {
    List<MyImage> data =
        _images.where((element) => element.isFavorite).toList();
    return data.isEmpty ? [] : data;
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/images.json');
    final parsedList = await json.decode(response);
    List<MyImage> listData = List<MyImage>.from(
        parsedList.map((data) => MyImage.fromJson(jsonEncode(data))).toList());
    _images = listData;
    notifyListeners();
  }
}
