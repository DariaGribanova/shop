import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/entity/calc_cart.dart';
import 'package:shop/data/model/entity/calculated_cart.dart';
import 'package:shop/data/model/entity/cart_update.dart';
import 'package:shop/data/service/cart_client.dart';

class CartService {
  CartService(this.cartClient);

  final EntityStateNotifier<CalcCart> _productState = EntityStateNotifier();

  EntityStateNotifier<CalcCart> get productState => _productState;
  final CartClient cartClient;

  Future<void> loadProducts() async {
    productState.loading(productState.value?.data);
    try {
      final response = await cartClient.cartCalc(
        request: CalculatedCart(),
      );
      productState.content(response);
    } catch (e) {
      productState.error();
      debugPrint(e.toString());
    }
  }

  Future<void> updateCart(int productId, int count) async {
    productState.loading(productState.value?.data);
    try {
      final response = await cartClient.putCart(
          request: CartUpdate(productId: productId, count: count));
      productState.content(response);
    } catch (e) {
      productState.error();
      debugPrint(e.toString());
    }
  }

  Future<void> addToCart(int productId) async {
    productState.loading(productState.value?.data);
    try {
      final response =
          await cartClient.postCart(request: CartUpdate(productId: productId));
      productState.content(response);
    } catch (e) {
      productState.error();
      debugPrint(e.toString());
    }
  }

  Future<void> deleteCart(int productId) async {
    productState.loading(productState.value?.data);
    try {
      final response = await cartClient.deleteCart(
          request: CartUpdate(productId: productId));
      productState.content(response);
    } catch (e) {
      productState.error();
      debugPrint(e.toString());
    }
  }
}
