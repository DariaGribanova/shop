import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/entity/calc_cart.dart';
import 'package:shop/data/model/entity/cart_product.dart';
import 'card_page_wm.dart';

@RoutePage()
class CartPageWidget extends ElementaryWidget<ICartPageWidgetModel> {
  const CartPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultCartPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICartPageWidgetModel wm) {
    final theme = wm.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Корзина"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: EntityStateNotifierBuilder<CalcCart>(
          listenableEntityState: wm.cartService.productState,
          loadingBuilder: (context, value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, e, value) {
            return const Center(
              child: Text("Ошибка!"),
            );
          },
          builder: (context, value) {
            final calcCart = value ??
                CalcCart(
                  price: Decimal.parse('0'),
                  count: 0,
                  products: [],
                );
            if (calcCart.products.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'В Вашей корзине пока ничего нет',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: TextButton(
                          onPressed: () {
                            wm.navigateToCatalogTab();
                          },
                          child: Text(
                            'ПЕРЕЙТИ К ПОКУПКАМ',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: theme.colorScheme.secondary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: calcCart.products.length,
                    itemBuilder: (context, index) {
                      final product = calcCart.products[index];
                      return ProductCard(
                        cartProduct: product,
                        add: () {
                          wm.updateCart(product.product.id, product.count + 1);
                        },
                        min: () {
                          wm.updateCart(product.product.id, product.count - 1);
                        },
                        del: () {
                          wm.deleteCart(product.product.id);
                        },
                      );
                    },
                  ),
                ),
                OrderCard(
                  onTab: () {
                    wm.navigateToOrderRoute();
                  },
                  calcCart: calcCart,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.cartProduct,
    required this.add,
    required this.min,
    required this.del,
  });

  final CartProduct cartProduct;
  final VoidCallback add;
  final VoidCallback min;
  final VoidCallback del;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Card(
          elevation: 0,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 0,
                child: CachedNetworkImage(
                  width: 88,
                  height: 88,
                  imageUrl: cartProduct.product.picture,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            '${cartProduct.product.name}\n\n',
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: del,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                "${cartProduct.product.price.toString()} ₽",
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            cartProduct.product.oldPrice != null
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      "${cartProduct.product.oldPrice.toString()} ₽",
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: theme.colorScheme.onSurface,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Container(),
                                  ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkResponse(
                              onTap: cartProduct.count == 1 ? null : min,
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: cartProduct.count == 1
                                      ? Colors.grey
                                      : Colors.black,
                                ),
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.remove,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                " ${cartProduct.count} ",
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkResponse(
                              onTap: add,
                              child: Ink(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.add,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.onTab,
    required this.calcCart,
  });

  final VoidCallback onTab;
  final CalcCart calcCart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      flex: 0,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "ИТОГО: ${calcCart.price} ₽",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Cкидка: -${calcCart.oldPrice != null ? (calcCart.oldPrice! - calcCart.price) : 0} ₽",
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: TextButton(
              onPressed: onTab,
              child: Text(
                'ОФОРМИТЬ ЗАКАЗ',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
