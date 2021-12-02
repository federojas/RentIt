class RentModel {
  String price;
  String productName;
  String description;
  String image;

  RentModel({this.price, this.productName, this.description, this.image});

  factory RentModel.fromMap(map) {
    return RentModel(
        price: map['price'],
        productName: map['productName'],
        description: map['description'],
        image: map['image']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'productName': productName,
      'description': description,
      'image': image
    };
  }
}