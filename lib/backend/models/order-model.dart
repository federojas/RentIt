class OrderModel {
  String publicationId;
  String price;
  String productName;
  String description;
  String uid;
  String image;
  String insuranceName;
  String insurancePrice;

  OrderModel({this.publicationId, this.price, this.productName, this.description, this.uid, this.image,  this.insuranceName, this.insurancePrice});

  factory OrderModel.fromMap(map) {
    return OrderModel(
        publicationId: map['publicationId'],
        price: map['price'],
        productName: map['productName'],
        description: map['description'],
        uid: map['uid'],
        image: map['image'],
        insuranceName: map['insuranceName'],
        insurancePrice: map['insurancePrice']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'publicationId': publicationId,
      'price': price,
      'productName': productName,
      'description': description,
      'uid': uid,
      'image': image,
      'insuranceName': insuranceName,
      'insurancePrice': insurancePrice
    };
  }
}