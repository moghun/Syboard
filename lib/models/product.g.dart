// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      productName: json['productName'] as String,
      rating: json['rating'] as num,
      seller: json['seller'] as String,
      price: json['price'] as num,
      onSale: json['onSale'] as bool,
      description: json['description'] as String,
      imgURL: json['imgURL'] as String,
      oldPrice: json['oldPrice'] as num?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'rating': instance.rating,
      'seller': instance.seller,
      'price': instance.price,
      'onSale': instance.onSale,
      'description': instance.description,
      'imgURL': instance.imgURL,
      'oldPrice': instance.oldPrice,
    };
