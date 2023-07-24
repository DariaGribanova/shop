import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/model/order_request.dart';
import 'package:shop/data/service/order_client.dart';

class OrderPageModel extends ElementaryModel {
  OrderPageModel(ErrorHandler errorHandler, this.orderClient)
      : super(errorHandler: errorHandler);
  final OrderClient orderClient;

  Future<void> order(OrderRequest orderRequest) async {
    try {
      final order = await orderClient.postOrder(
        request: orderRequest,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
