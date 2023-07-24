import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/data/components/pagination_builder.dart';
import 'catalog_page_wm.dart';

@RoutePage()
class CatalogPageWidget extends ElementaryWidget<ICatalogPageWidgetModel> {
  const CatalogPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultCatalogPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICatalogPageWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Каталог"),
        centerTitle: true,
      ),
      body: PaginationBuilder<Product>(
        paginationCallback: wm.loadProducts,
        builder: (context, controller, snapshot) {
          final products = snapshot.data;
          if (products == null || products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 8 / 13,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                        onTap: () {
                          // Открыть карточку товара
                        },
                        child: ProductCard(
                          product: product,
                          onTab: () {
                            wm.addToCart(product.id);
                          },
                        ));
                  },
                  itemCount: products.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTab,
  });

  final VoidCallback onTab;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: CachedNetworkImage(
              imageUrl: product.picture,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${product.name}\n',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "${product.price.toString()} ₽",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  subtitle: product.oldPrice != null
                      ? Text(
                          "${product.oldPrice.toString()} ₽",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      : const Text(" "),
                  trailing: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      onPressed: onTab,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
