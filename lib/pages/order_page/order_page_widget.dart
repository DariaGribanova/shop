import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/payment/payment.dart';
import 'order_page_wm.dart';

@RoutePage()
class OrderPageWidget extends ElementaryWidget<IOrderPageWidgetModel> {
  const OrderPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultOrderPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOrderPageWidgetModel wm) {
    final theme = wm.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Оформление заказа"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    "Данные получателя",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: wm.nameController,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.onBackground),
                    decoration: InputDecoration(
                      hintText: 'ФИО',
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: wm.phoneController,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.onBackground),
                    decoration: InputDecoration(
                      hintText: '+7 000 000 00 00',
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: wm.emailController,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.onBackground),
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    "Выбор адреса доставки",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'ВЫБРАТЬ АДРЕС',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.colorScheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    "Способ оплаты",
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            EntityStateNotifierBuilder(
                listenableEntityState: wm.paymentsState,
                loadingBuilder: (context, data) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                builder: (context, data) {
                  final payments = data?.$1 ?? [];
                  final selected = data?.$2;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final payment = payments[index];
                        return _Payment(
                          payment: payment,
                          theme: theme,
                          selected: selected,
                          onTap: () => wm.selectPayment(
                            payment,
                          ),
                        );
                      },
                      childCount: payments.length,
                    ),
                  );
                }),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Товары",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Text(
                        "${wm.cartService.productState.value?.data?.price} ₽",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Итог",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Text(
                        "${wm.cartService.productState.value?.data?.price} ₽",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: TextButton(
                      onPressed: () {
                        wm.makeOrder();
                      },
                      child: Text(
                        'ПЕРЕЙТИ К ОПЛАТЕ',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.colorScheme.secondary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Payment extends StatelessWidget {
  const _Payment({
    required this.payment,
    required this.theme,
    required this.selected,
    this.onTap,
  });

  final Payment payment;
  final ThemeData theme;
  final Payment? selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(0)),
      ),
      child: SizedBox(
        height: 94,
        child: ListTile(
          tileColor: Colors.white,
          onTap: onTap,
          title: Text(
            payment.title,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          ),
          subtitle: Text(
            payment.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          ),
          trailing: payment == selected ? const Icon(Icons.check) : null,
        ),
      ),
    );
  }
}
