class ProductModel {
  String name;
  String detail;
  String category;
  String image;

  ProductModel({this.name, this.detail, this.category, this.image});

  factory ProductModel.fromMap(map) {
    return ProductModel(
      name: map['name'],
      detail: map['detail'],
      category: map['category'],
      image: map['image']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'detail': detail,
      'category': category,
      'image': image
    };
  }
}