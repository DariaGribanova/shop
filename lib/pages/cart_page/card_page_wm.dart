import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/service/cart_service.dart';
import 'package:shop/navigation/app_router.dart';
import 'cart_page_model.dart';
import 'cart_page_widget.dart';

abstract class ICartPageWidgetModel extends IWidgetModel {
  Future<void> loadProducts();

  Future<void> updateCart(int productId, int count);

  Future<void> deleteCart(int productId);

  void navigateToCatalogTab();
  void navigateToOrderRoute();

  ThemeData get theme;

  CartService get cartService;
}

CartPageWidgetModel defaultCartPageWidgetModelFactory(BuildContext context) {
  return CartPageWidgetModel(CartPageModel(context.read(), context.read()));
}

class CartPageWidgetModel extends WidgetModel<CartPageWidget, CartPageModel>
    implements ICartPageWidgetModel {
  CartPageWidgetModel(CartPageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    loadProducts();
  }

  @override
  Future<void> loadProducts() async {
    cartService.productState.loading(cartService.productState.value?.data);
    try {
      final data = await model.getNextPage();
      cartService.productState.content(data);
    } catch (e) {
      cartService.productState.error();
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> updateCart(int productId, int count) async {
    cartService.productState.loading(cartService.productState.value?.data);
    try {
      final data = await model.updateCart(productId, count);
      cartService.productState.content(data);
    } catch (e) {
      cartService.productState.error();
      debugPrint(e.toString());
    }
  }

  @override
  void navigateToCatalogTab() {
    context.router.navigate(
      CatalogTab(children: [
        CatalogRouteWidget(),
      ]),
    );
  }

  @override
  void navigateToOrderRoute() {
    context.router.navigate(OrderRouteWidget());
  }

  @override
  Future<void> deleteCart(int productId) async {
    cartService.productState.loading(cartService.productState.value?.data);
    try {
      final data = await model.deleteCart(productId);
      cartService.productState.content(data);
    } catch (e) {
      cartService.productState.error();
      debugPrint(e.toString());
    }
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  CartService get cartService => context.read();
}
