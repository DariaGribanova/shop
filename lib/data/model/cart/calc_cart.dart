import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/data/model/cart/cart_product.dart';

part 'calc_cart.freezed.dart';

part 'calc_cart.g.dart';

@freezed
class CalcCart with _$CalcCart {
  factory CalcCart({
    required Decimal price,
    required int count,
    required List<CartProduct> products,
    @JsonKey(name: 'old_price') Decimal? oldPrice,
    bool? applied,
  }) = _CalcCart;

  factory CalcCart.fromJson(Map<String, dynamic> json) =>
      _$CalcCartFromJson(json);
}
