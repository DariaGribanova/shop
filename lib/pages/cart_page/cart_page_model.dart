import 'package:decimal/decimal.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/entity/calc_cart.dart';
import 'package:shop/data/model/entity/calculated_cart.dart';
import 'package:shop/data/model/entity/cart_update.dart';
import 'package:shop/data/service/cart_client.dart';

class CartPageModel extends ElementaryModel {
  CartPageModel(ErrorHandler errorHandler, this.cartClient)
      : super(errorHandler: errorHandler);

  final CartClient cartClient;

  Future<CalcCart> getNextPage() async {
    try {
      final response = await cartClient.cartCalc(
        request: CalculatedCart(),
      );

      return (response);
    } catch (e) {
      debugPrint(e.toString());
    }
    return CalcCart(price: Decimal.parse('0'), count: 0, products: [], );
  }

  Future<CalcCart> updateCart(int productId, int count) async {
    try {
      if (count == 0){
        final response = await cartClient.deleteCart(request: CartUpdate(productId: productId));
        return (response);
      } else {
        final response = await cartClient.putCart(request: CartUpdate(productId: productId, count: count));
        return (response);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return CalcCart(price: Decimal.parse('0'), count: 0, products: [], );
  }

  Future<CalcCart> deleteCart(int productId) async {
    try {
        final response = await cartClient.deleteCart(request: CartUpdate(productId: productId));
        return (response);
    } catch (e) {
      debugPrint(e.toString());
    }
    return CalcCart(price: Decimal.parse('0'), count: 0, products: [], );
  }

}
