import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
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
        child: ListView(
          children: [
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
            // ...Выбор способа оплаты...
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
    );
  }
}
