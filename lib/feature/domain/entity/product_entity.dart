import 'package:equatable/equatable.dart';

/*
Entity field are required for the data we want,
like name, price, etc.
Equatable for value equality
*/ 
class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String discription;
  final int category;
  final double price;
  final String imageUrl;
  final int stockk;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.discription,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.stockk,
  });

  @override
  List<Object?> get props =>
      [id, name, discription, category, price, imageUrl, stockk];

  @override
  bool get stringify => true;
}
