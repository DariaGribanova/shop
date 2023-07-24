import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/catalog/catalog_products_request.dart';
import 'package:shop/data/model/product/product.dart';
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
}
