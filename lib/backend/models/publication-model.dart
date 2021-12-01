import 'package:argon_flutter/backend/net/flutterfire.dart';

class PublicationModel {
  String name;
  String uid;
  String detail;
  String category;
  String price;
  String timeUnit;
  String id;
  bool isFavourite;
  List<String> images;

  PublicationModel({this.name, this.uid, this.detail, this.category, this.price, this.images, this.timeUnit, this.id, this.isFavourite}) {
    this.images = [];
  }

  factory PublicationModel.fromMap(map) {
    return PublicationModel(
      name: map['name'],
      uid: map['uid'],
      detail: map['detail'],
      category: map['category'],
      price: map['price'],
      images: map['images'],
      timeUnit: map['timeUnit'],
      id: map['id'],
      isFavourite: map['isFavourite']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'detail': detail,
      'category': category,
      'price': price,
      'images': images,
      'timeUnit': timeUnit,
      'id': id,
      'isFavourite': isFavourite
    };
  }
}