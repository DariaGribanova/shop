import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:decimal/decimal.dart';
import 'package:shop/data/model/badge.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required Decimal price,
    double? discount,
    @JsonKey(name: "old_price") Decimal? oldPrice,
    required String name,
    String? article,
    required String picture,
    required List<Badge> badges,
    @JsonKey(name: "reviews_count") int? reviewsCount,
    required String brand,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
