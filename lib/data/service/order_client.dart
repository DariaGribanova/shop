import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop/data/model/order.dart';
import 'package:shop/data/model/order_request.dart';

part 'order_client.g.dart';

@RestApi()
abstract class OrderClient {
  factory OrderClient(Dio dio, {String baseUrl}) = _OrderClient;

  @POST("/order/order/")
  Future<Order> postOrder({
    @Body() required OrderRequest request,
  });
}
