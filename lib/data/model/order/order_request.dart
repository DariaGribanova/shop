import 'package:shop/data/model/product/product_with_count.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_request.freezed.dart';

part 'order_request.g.dart';

@freezed
class OrderRequest with _$OrderRequest {
  factory OrderRequest({
    required List<ProductWithCount> products,
    required String user_name,
    required String user_phone,
    required String user_email,
    required String delivery_id,
    required String delivery_type,
    required String payment_id,
    required String payment_type,
  }) = _OrderRequest;

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);
}
