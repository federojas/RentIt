import 'package:argon_flutter/backend/models/product-model.dart';

class PublicationModel {
  String name;
  ProductModel productModel;
  double price;
  String uid;

  PublicationModel({this.name, this.productModel, this.price, this.uid});

  factory PublicationModel.fromMap(map) {
    return PublicationModel(
      name: map['name'],
      productModel: map['productModel'],
      price: map['price'],
      uid: map['uid']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'productModel': productModel,
      'price': price,
      'uid': uid
    };
  }
}