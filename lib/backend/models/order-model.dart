class OrderModel {
  String publicationId;
  String price;
  String productName;
  String uid;

  OrderModel({this.publicationId, this.price, this.productName, this.uid});

  factory OrderModel.fromMap(map) {
    return OrderModel(
        publicationId: map['publicationId'],
        price: map['price'],
        productName: map['productName'],
        uid: map['uid']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'publicationId': publicationId,
      'price': price,
      'productName': productName,
      'uid': uid
    };
  }
}