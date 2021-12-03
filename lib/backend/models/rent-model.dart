class RentModel {
  String price;
  String productName;
  String description;
  String image;
  String time;
  String timeUnit;
  String insurance;

  factory RentModel.fromMap(map) {
    return RentModel(
        price: map['price'],
        productName: map['productName'],
        description: map['description'],
        image: map['image'],
        time: map['time'],
        timeUnit: map['timeUnit'],
        insurance: map['insurance'],
    );
  }
  RentModel({this.price, this.productName, this.description, this.image, this.time, this.timeUnit, this.insurance});

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'productName': productName,
      'description': description,
      'image': image,
      'time': time,
      'timeUnit': timeUnit,
      'insurance': insurance
    };
  }
}