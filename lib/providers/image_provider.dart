import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/modal/item_modal.dart';

class MyImageProvider extends ChangeNotifier {
  List<MyImage> _images = [];

  List<MyImage> get images {
    return [..._images];
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/images.json');
    final parsedList = await json.decode(response);
    List<MyImage> ListData = List<MyImage>.from(
        parsedList.map((data) => MyImage.fromJson(jsonEncode(data))).toList());
    _images = ListData;
    notifyListeners();
  }
}
