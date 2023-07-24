import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shop/data/model/product/product_cart.dart';

part 'cart_product.freezed.dart';

part 'cart_product.g.dart';

@freezed
class CartProduct with _$CartProduct {
  factory CartProduct({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'product') required ProductCart product,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
