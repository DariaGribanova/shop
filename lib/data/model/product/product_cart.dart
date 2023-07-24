import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:decimal/decimal.dart';
import 'package:shop/data/model/badge.dart';

part 'product_cart.freezed.dart';

part 'product_cart.g.dart';

@freezed
class ProductCart with _$ProductCart {
  const factory ProductCart({
    required int id,
    required Decimal price,
    String? discount,
    @JsonKey(name: "old_price") Decimal? oldPrice,
    required String name,
    String? article,
    required String picture,
    required List<Badge> badges,
    @JsonKey(name: "reviews_count") int? reviewsCount,
    required String brand,
  }) = _ProductCart;

  factory ProductCart.fromJson(Map<String, dynamic> json) =>
      _$ProductCartFromJson(json);
}
