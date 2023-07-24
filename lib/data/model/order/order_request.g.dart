// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderRequest _$$_OrderRequestFromJson(Map<String, dynamic> json) =>
    _$_OrderRequest(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductWithCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      user_name: json['user_name'] as String,
      user_phone: json['user_phone'] as String,
      user_email: json['user_email'] as String,
      delivery_id: json['delivery_id'] as String,
      delivery_type: json['delivery_type'] as String,
      payment_id: json['payment_id'] as String,
      payment_type: json['payment_type'] as String,
    );

Map<String, dynamic> _$$_OrderRequestToJson(_$_OrderRequest instance) =>
    <String, dynamic>{
      'products': instance.products,
      'user_name': instance.user_name,
      'user_phone': instance.user_phone,
      'user_email': instance.user_email,
      'delivery_id': instance.delivery_id,
      'delivery_type': instance.delivery_type,
      'payment_id': instance.payment_id,
      'payment_type': instance.payment_type,
    };
