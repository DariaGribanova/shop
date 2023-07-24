import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/service/cart_service.dart';
import 'package:shop/data/error_handler.dart';
import 'package:shop/data/service/cart_client.dart';
import 'package:shop/data/service/catalog_client.dart';
import 'package:shop/data/service/order_client.dart';
import 'package:shop/shop_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppDependency extends StatelessWidget {
  const AppDependency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (context) {
            var dio = Dio();

            dio.options.baseUrl = "https://farm.fbtw.ru";
            dio.options.headers['Content-Type'] = 'application/json';
            dio.interceptors.add(PrettyDioLogger());

            String bearerToken =
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkyNDc0NTQxLCJpYXQiOjE2ODk4ODI1NDEsImp0aSI6IjA5ZjNjNDhhZmYyNTQyNDY4NTExZTczYjQ0YTg4M2JmIiwidXNlcl9pZCI6NDEsImlzX3ZlcmlmaWVkIjp0cnVlfQ.9CyqmaM7MNbQE9FKwOIDNly7hAze_W-8fmaPMgtO4Yc';
            dio.options.headers['Authorization'] = 'Bearer $bearerToken';

            return dio;
          },
        ),
        Provider<ErrorHandler>(create: (_) => DefaultErrorHandler()),
        Provider(
          create: (context) => CatalogClient(
            context.read(),
          ),
        ),
        Provider(
          create: (context) => CartClient(
            context.read(),
          ),
        ),
        Provider(
          create: (context) => OrderClient(
            context.read(),
          ),
        ),
        Provider(
          create: (context) => CartService(
            context.read(),
          ),
        ),
      ],
      child: ShopApp(),
    );
  }
}
