// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product call(
      {required String productName,
      required double rating,
      required String seller,
      required double price,
      required bool onSale,
      required String description,
      required String imgURL,
      double? oldPrice}) {
    return _Product(
      productName: productName,
      rating: rating,
      seller: seller,
      price: price,
      onSale: onSale,
      description: description,
      imgURL: imgURL,
      oldPrice: oldPrice,
    );
  }

  Product fromJson(Map<String, Object?> json) {
    return Product.fromJson(json);
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  String get productName => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get seller => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get onSale => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imgURL => throw _privateConstructorUsedError;
  double? get oldPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String productName,
      double rating,
      String seller,
      double price,
      bool onSale,
      String description,
      String imgURL,
      double? oldPrice});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? productName = freezed,
    Object? rating = freezed,
    Object? seller = freezed,
    Object? price = freezed,
    Object? onSale = freezed,
    Object? description = freezed,
    Object? imgURL = freezed,
    Object? oldPrice = freezed,
  }) {
    return _then(_value.copyWith(
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      seller: seller == freezed
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      onSale: onSale == freezed
          ? _value.onSale
          : onSale // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgURL: imgURL == freezed
          ? _value.imgURL
          : imgURL // ignore: cast_nullable_to_non_nullable
              as String,
      oldPrice: oldPrice == freezed
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String productName,
      double rating,
      String seller,
      double price,
      bool onSale,
      String description,
      String imgURL,
      double? oldPrice});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object? productName = freezed,
    Object? rating = freezed,
    Object? seller = freezed,
    Object? price = freezed,
    Object? onSale = freezed,
    Object? description = freezed,
    Object? imgURL = freezed,
    Object? oldPrice = freezed,
  }) {
    return _then(_Product(
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      seller: seller == freezed
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      onSale: onSale == freezed
          ? _value.onSale
          : onSale // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgURL: imgURL == freezed
          ? _value.imgURL
          : imgURL // ignore: cast_nullable_to_non_nullable
              as String,
      oldPrice: oldPrice == freezed
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product implements _Product {
  _$_Product(
      {required this.productName,
      required this.rating,
      required this.seller,
      required this.price,
      required this.onSale,
      required this.description,
      required this.imgURL,
      this.oldPrice});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String productName;
  @override
  final double rating;
  @override
  final String seller;
  @override
  final double price;
  @override
  final bool onSale;
  @override
  final String description;
  @override
  final String imgURL;
  @override
  final double? oldPrice;

  @override
  String toString() {
    return 'Product(productName: $productName, rating: $rating, seller: $seller, price: $price, onSale: $onSale, description: $description, imgURL: $imgURL, oldPrice: $oldPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.seller, seller) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.onSale, onSale) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imgURL, imgURL) &&
            const DeepCollectionEquality().equals(other.oldPrice, oldPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(seller),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(onSale),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(imgURL),
      const DeepCollectionEquality().hash(oldPrice));

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  factory _Product(
      {required String productName,
      required double rating,
      required String seller,
      required double price,
      required bool onSale,
      required String description,
      required String imgURL,
      double? oldPrice}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String get productName;
  @override
  double get rating;
  @override
  String get seller;
  @override
  double get price;
  @override
  bool get onSale;
  @override
  String get description;
  @override
  String get imgURL;
  @override
  double? get oldPrice;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
