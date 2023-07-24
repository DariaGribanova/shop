import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shop/data/model/catalog/catalog_products_request.dart';
import 'package:shop/data/model/catalog/catalog_products_response.dart';

part 'catalog_client.g.dart';

@RestApi()
abstract class CatalogClient {
  factory CatalogClient(
    Dio dio, {
    String baseUrl,
  }) = _CatalogClient;

  @POST("/catalog/products/")
  Future<CatalogProductsResponse> getProducts({
    @Query('page') int? page,
    @Query('size') int? size,
    @Body() required CatalogProductsRequest request,
  });
}
