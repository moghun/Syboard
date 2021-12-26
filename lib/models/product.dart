import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product{

  factory Product({

  required String productName,
  required double rating,
  required String seller,
  required double price,
  required bool onSale,
  required String description,
  required String imgURL,
  double? oldPrice,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  //Map<String, dynamic> toJson() => _$ProductToJson(this);
}

