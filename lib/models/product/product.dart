import 'package:json_annotation/json_annotation.dart';
import 'package:poc/models/product/rating.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int? id;
  final String title;
  final double? price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  static const empty = Product(
    id: null,
    title: '',
    price: null,
    description: '',
    category: '',
    image: '',
    rating: Rating.empty,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
