import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/service/cart_service.dart';
import 'package:shop/data/model/product/product.dart';
import 'package:shop/data/service/catalog_client.dart';
import 'catalog_page_model.dart';
import 'catalog_page_widget.dart';

abstract class ICatalogPageWidgetModel extends IWidgetModel {
  Future<(List<Product> content, bool isMore)> loadProducts(_);

  Future<void> addToCart(int productId);

  CartService get cartService;
}

CatalogPageWidgetModel defaultCatalogPageWidgetModelFactory(
    BuildContext context) {
  return CatalogPageWidgetModel(
      CatalogPageModel(context.read(), context.read(), context.read()),
      context.read());
}

class CatalogPageWidgetModel
    extends WidgetModel<CatalogPageWidget, CatalogPageModel>
    implements ICatalogPageWidgetModel {
  final CatalogClient catalogClient;

  CatalogPageWidgetModel(CatalogPageModel model, this.catalogClient)
      : super(model);

  @override
  Future<(List<Product>, bool)> loadProducts(_) async {
    try {
      final data = await model.getNextPage();
      return data;
    } catch (e) {
      debugPrint(e.toString());
    }
    return (<Product>[], false);
  }

  @override
  Future<void> addToCart(int productId) async {
    cartService.addToCart(productId);
  }

  @override
  CartService get cartService => context.read();
}
