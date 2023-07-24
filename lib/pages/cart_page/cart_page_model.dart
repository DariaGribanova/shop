import 'package:decimal/decimal.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/cart/calc_cart.dart';
import 'package:shop/data/model/cart/calculated_cart.dart';

import 'package:shop/data/service/cart_client.dart';

class CartPageModel extends ElementaryModel {
  CartPageModel(ErrorHandler errorHandler, this.cartClient)
      : super(errorHandler: errorHandler);

  final CartClient cartClient;

  Future<CalcCart> getCart() async {
    try {
      final response = await cartClient.cartCalc(
        request: CalculatedCart(),
      );

      return (response);
    } catch (e) {
      debugPrint(e.toString());
    }
    return CalcCart(
      price: Decimal.parse('0'),
      count: 0,
      products: [],
    );
  }
}
