class ProductModel {
  String name;
  String detail;
  String category;

  ProductModel({this.name, this.detail, this.category});

  factory ProductModel.fromMap(map) {
    return ProductModel(
      name: map['name'],
      detail: map['detail'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'detail': detail,
      'category': category,
    };
  }
}