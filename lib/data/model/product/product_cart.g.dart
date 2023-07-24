// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCart _$$_ProductCartFromJson(Map<String, dynamic> json) =>
    _$_ProductCart(
      id: json['id'] as int,
      price: Decimal.fromJson(json['price'] as String),
      discount: json['discount'] as String?,
      oldPrice: json['old_price'] == null
          ? null
          : Decimal.fromJson(json['old_price'] as String),
      name: json['name'] as String,
      article: json['article'] as String?,
      picture: json['picture'] as String,
      badges: (json['badges'] as List<dynamic>)
          .map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewsCount: json['reviews_count'] as int?,
      brand: json['brand'] as String,
    );

Map<String, dynamic> _$$_ProductCartToJson(_$_ProductCart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'discount': instance.discount,
      'old_price': instance.oldPrice,
      'name': instance.name,
      'article': instance.article,
      'picture': instance.picture,
      'badges': instance.badges,
      'reviews_count': instance.reviewsCount,
      'brand': instance.brand,
    };
