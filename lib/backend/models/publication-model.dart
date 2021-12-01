class PublicationModel {
  String name;
  String uid;
  String detail;
  String category;
  String price;
  String timeUnit;
  List<String> images;

  PublicationModel({this.name, this.uid, this.detail, this.category, this.price, this.images, this.timeUnit}) {
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
      timeUnit: map['timeUnit']

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
      'timeUnit': timeUnit
    };
  }
}