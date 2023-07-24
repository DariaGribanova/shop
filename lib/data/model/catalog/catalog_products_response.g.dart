// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CatalogProductsResponse _$$_CatalogProductsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CatalogProductsResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CatalogProductsResponseToJson(
        _$_CatalogProductsResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
