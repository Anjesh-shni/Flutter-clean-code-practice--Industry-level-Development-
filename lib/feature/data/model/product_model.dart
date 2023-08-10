import 'package:pos_app/feature/domain/entity/product_entity.dart';
import 'option_model.dart';

// ignore: must_be_immutable
class Products extends ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final int stock;
  final int categoryId;
  List<Options>? options;

  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.stock,
    required this.categoryId,
    this.options,
  }) : super(
          id: id,
          name: name,
          discription: description,
          category: categoryId,
          price: price,
          imageUrl: image,
          stockk: stock,
        );

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'] ?? "name",
      description: json['description'],
      price: json['price']?.toDouble() ?? 0.0,
      image: json['image'],
      stock: json['stock'],
      categoryId: json['categoryId'],
      options: json['options'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['stock'] = this.stock;
    data['categoryId'] = this.categoryId;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
