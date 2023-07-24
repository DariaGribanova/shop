import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop/data/model/cart/calc_cart.dart';
import 'package:shop/data/model/cart/calculated_cart.dart';
import 'package:shop/data/model/cart/cart_update.dart';

part 'cart_client.g.dart';

@RestApi()
abstract class CartClient {
  factory CartClient(Dio dio, {String baseUrl}) = _CartClient;

  @POST("/cart/calculate/")
  Future<CalcCart> cartCalc({
    @Body() required CalculatedCart request,
  });

  @POST("/cart/cart/")
  Future<CalcCart> postCart({
    @Body() required CartUpdate request,
  });

  @PUT("/cart/cart/")
  Future<CalcCart> putCart({
    @Body() required CartUpdate request,
  });

  @DELETE("/cart/cart/")
  Future<CalcCart> deleteCart({
    @Body() required CartUpdate request,
  });
}
