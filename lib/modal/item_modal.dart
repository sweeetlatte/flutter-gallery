import 'dart:convert';

class MyImage {
  String id;
  String name;
  String image;

  MyImage({required this.id, required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'image': image};
  }

  factory MyImage.fromMap(Map<String, dynamic> map) {
    return MyImage(
        id: map['id'] as String,
        name: map['name'] as String,
        image: map['image'] as String);
  }

  String toJson() => json.encode(toMap());

  factory MyImage.fromJson(String source) =>
      MyImage.fromMap(json.decode(source) as Map<String, dynamic>);
}
