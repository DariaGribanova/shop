import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/service/cart_service.dart';
import 'package:shop/data/model/order_request.dart';
import 'package:shop/data/model/product_with_count.dart';
import 'package:shop/data/service/order_client.dart';
import 'order_page_model.dart';
import 'order_page_widget.dart';

abstract class IOrderPageWidgetModel extends IWidgetModel {
  TextEditingController get nameController;

  TextEditingController get phoneController;

  TextEditingController get emailController;

  ThemeData get theme;

  CartService get cartService;

  Future<void> makeOrder();
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
      payment_id: '1',
      payment_type: 'cash',
    );
    await model.order(orderRequest);
    cartService.loadProducts();
  }

  @override
  CartService get cartService => context.read();
}
