import 'package:argon_flutter/backend/models/product-model.dart';

class PublicationModel {
  String name;
  ProductModel productModel;
  double price;

  PublicationModel({this.name, this.productModel, this.price});

  factory PublicationModel.fromMap(map) {
    return PublicationModel(
      name: map['name'],
      productModel: map['productModel'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'productModel': productModel,
      'price': price,
    };
  }
}