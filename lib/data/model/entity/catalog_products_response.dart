import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/data/model/product.dart';

part 'catalog_products_response.freezed.dart';

part 'catalog_products_response.g.dart';

@freezed
class CatalogProductsResponse with _$CatalogProductsResponse {
  factory CatalogProductsResponse({
    required int count,
    required String? next,
    required String? previous,
    required List<Product> results,
  }) = _CatalogProductsResponse;

  factory CatalogProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogProductsResponseFromJson(json);
}
