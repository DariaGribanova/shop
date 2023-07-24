import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/model/order/order_request.dart';
import 'package:shop/data/model/payment/payment.dart';
import 'package:shop/data/model/payment/payments_request.dart';
import 'package:shop/data/model/product/product_with_count.dart';
import 'package:shop/data/service/cart_service.dart';
import 'package:shop/data/service/order_client.dart';
import 'package:shop/navigation/app_router.dart';
import 'order_page_model.dart';
import 'order_page_widget.dart';

abstract class IOrderPageWidgetModel extends IWidgetModel {
  TextEditingController get nameController;

  TextEditingController get phoneController;

  TextEditingController get emailController;

  ThemeData get theme;

  CartService get cartService;

  void selectPayment(Payment payment);

  Future<void> makeOrder();

  EntityStateNotifier<(List<Payment>, Payment?)> get paymentsState;
}

OrderPageWidgetModel defaultOrderPageWidgetModelFactory(BuildContext context) {
  return OrderPageWidgetModel(
      OrderPageModel(context.read(), context.read()), context.read());
}

class OrderPageWidgetModel extends WidgetModel<OrderPageWidget, OrderPageModel>
    implements IOrderPageWidgetModel {
  final OrderClient orderClient;

  OrderPageWidgetModel(OrderPageModel model, this.orderClient) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    loadPayments();
  }

  @override
  final TextEditingController nameController = TextEditingController();

  @override
  final TextEditingController emailController = TextEditingController();
  @override
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  Future<void> makeOrder() async {
    final selectedPayment = paymentsState.value?.data?.$2;
    final prods = <ProductWithCount>[];
    cartService.productState.value?.data?.products.forEach((element) {
      prods.add(ProductWithCount(
          productId: element.product.id, count: element.count));
    });
    final orderRequest = OrderRequest(
      products: prods,
      user_name: nameController.text,
      user_phone: phoneController.text,
      user_email: emailController.text,
      delivery_id: '1',
      delivery_type: 'pickup',
      payment_id: selectedPayment?.id ?? '',
      payment_type: selectedPayment?.type ?? '',
    );
    await model.order(orderRequest);
    cartService.loadProducts();

    context.router.navigate(
      CartTab(children: [
        CartRouteWidget(),
      ]),
    );
  }

  Future<void> loadPayments() async {
    paymentsState.loading(paymentsState.value?.data);
    final prods = <ProductWithCount>[];
    cartService.productState.value?.data?.products.forEach((element) {
      prods.add(ProductWithCount(
          productId: element.product.id, count: element.count));
    });
    try {
      final payments = await orderClient.getPayments(
        request: PaymentsRequest(
          products: prods,
          deliveryId: '1',
        ),
      );
      paymentsState.content((payments, payments.firstOrNull));
    } catch (e) {
      paymentsState.error();
      debugPrint(e.toString());
    }
  }

  @override
  void selectPayment(Payment payment) {
    final payments = paymentsState.value!.data!.$1;
    paymentsState.content((payments, payment));
  }

  @override
  CartService get cartService => context.read();

  @override
  EntityStateNotifier<(List<Payment>, Payment?)> paymentsState =
      EntityStateNotifier();
}
