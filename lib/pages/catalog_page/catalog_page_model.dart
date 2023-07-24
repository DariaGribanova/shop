import 'package:decimal/decimal.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/entity/calc_cart.dart';
import 'package:shop/data/model/entity/cart_update.dart';
import 'package:shop/data/model/entity/catalog_products_request.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/data/service/cart_client.dart';
import 'package:shop/data/service/catalog_client.dart';

class CatalogPageModel extends ElementaryModel {
  CatalogPageModel(
      ErrorHandler errorHandler, this.catalogClient, this.cartClient)
      : super(errorHandler: errorHandler);

  final CatalogClient catalogClient;
  final CartClient cartClient;
  int _page = 1;
  bool isMore = true;

  Future<(List<Product> content, bool isMore)> getNextPage() async {
    try {
      if (!isMore) {
        return (<Product>[], false);
      }
      final response = await catalogClient.getProducts(
        page: _page,
        size: 0,
        request: CatalogProductsRequest(),
      );
      isMore = response.next != null;
      _page++;
      return (
        response.results,
        isMore,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return (<Product>[], false);
  }

  Future<CalcCart> addToCart(int productId) async {
    try {
      final response =
          await cartClient.postCart(request: CartUpdate(productId: productId));
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