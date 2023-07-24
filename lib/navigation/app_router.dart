import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/cart_page/card_page_wm.dart';
import 'package:shop/pages/cart_page/cart_page_widget.dart';
import 'package:shop/pages/catalog_page/catalog_page_widget.dart';
import 'package:shop/pages/catalog_page/catalog_page_wm.dart';
import 'package:shop/pages/empty_page.dart';
import 'package:shop/pages/home_page/home_page.dart';
import 'package:shop/pages/order_page/order_page_widget.dart';
import 'package:shop/pages/order_page/order_page_wm.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          children: [
            AutoRoute(initial: true, page: CatalogTab.page, children: [
              AutoRoute(
                initial: true,
                page: CatalogRouteWidget.page,
              ),
            ]),
            AutoRoute(page: CartTab.page, children: [
              AutoRoute(
                initial: true,
                page: CartRouteWidget.page,
              ),
              AutoRoute(
                page: OrderRouteWidget.page,
              ),
            ]),
            AutoRoute(page: EmptyTab.page, children: [
              AutoRoute(
                initial: true,
                page: EmptyRoute.page,
              ),
            ]),
          ],
        ),
      ];
}

@RoutePage(name: 'CatalogTab')
class CatalogTabPage extends AutoRouter {
  const CatalogTabPage({super.key});
}

@RoutePage(name: 'CartTab')
class CartTabPage extends AutoRouter {
  const CartTabPage({super.key});
}

@RoutePage(name: 'EmptyTab')
class EmptyTabPage extends AutoRouter {
  const EmptyTabPage({super.key});
}
