// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) {
  return _OrderRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderRequest {
  List<ProductWithCount> get products => throw _privateConstructorUsedError;
  String get user_name => throw _privateConstructorUsedError;
  String get user_phone => throw _privateConstructorUsedError;
  String get user_email => throw _privateConstructorUsedError;
  String get delivery_id => throw _privateConstructorUsedError;
  String get delivery_type => throw _privateConstructorUsedError;
  String get payment_id => throw _privateConstructorUsedError;
  String get payment_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderRequestCopyWith<OrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderRequestCopyWith<$Res> {
  factory $OrderRequestCopyWith(
          OrderRequest value, $Res Function(OrderRequest) then) =
      _$OrderRequestCopyWithImpl<$Res, OrderRequest>;
  @useResult
  $Res call(
      {List<ProductWithCount> products,
      String user_name,
      String user_phone,
      String user_email,
      String delivery_id,
      String delivery_type,
      String payment_id,
      String payment_type});
}

/// @nodoc
class _$OrderRequestCopyWithImpl<$Res, $Val extends OrderRequest>
    implements $OrderRequestCopyWith<$Res> {
  _$OrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? user_name = null,
    Object? user_phone = null,
    Object? user_email = null,
    Object? delivery_id = null,
    Object? delivery_type = null,
    Object? payment_id = null,
    Object? payment_type = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductWithCount>,
      user_name: null == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String,
      user_phone: null == user_phone
          ? _value.user_phone
          : user_phone // ignore: cast_nullable_to_non_nullable
              as String,
      user_email: null == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String,
      delivery_id: null == delivery_id
          ? _value.delivery_id
          : delivery_id // ignore: cast_nullable_to_non_nullable
              as String,
      delivery_type: null == delivery_type
          ? _value.delivery_type
          : delivery_type // ignore: cast_nullable_to_non_nullable
              as String,
      payment_id: null == payment_id
          ? _value.payment_id
          : payment_id // ignore: cast_nullable_to_non_nullable
              as String,
      payment_type: null == payment_type
          ? _value.payment_type
          : payment_type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderRequestCopyWith<$Res>
    implements $OrderRequestCopyWith<$Res> {
  factory _$$_OrderRequestCopyWith(
          _$_OrderRequest value, $Res Function(_$_OrderRequest) then) =
      __$$_OrderRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductWithCount> products,
      String user_name,
      String user_phone,
      String user_email,
      String delivery_id,
      String delivery_type,
      String payment_id,
      String payment_type});
}

/// @nodoc
class __$$_OrderRequestCopyWithImpl<$Res>
    extends _$OrderRequestCopyWithImpl<$Res, _$_OrderRequest>
    implements _$$_OrderRequestCopyWith<$Res> {
  __$$_OrderRequestCopyWithImpl(
      _$_OrderRequest _value, $Res Function(_$_OrderRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? user_name = null,
    Object? user_phone = null,
    Object? user_email = null,
    Object? delivery_id = null,
    Object? delivery_type = null,
    Object? payment_id = null,
    Object? payment_type = null,
  }) {
    return _then(_$_OrderRequest(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductWithCount>,
      user_name: null == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String,
      user_phone: null == user_phone
          ? _value.user_phone
          : user_phone // ignore: cast_nullable_to_non_nullable
              as String,
      user_email: null == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String,
      delivery_id: null == delivery_id
          ? _value.delivery_id
          : delivery_id // ignore: cast_nullable_to_non_nullable
              as String,
      delivery_type: null == delivery_type
          ? _value.delivery_type
          : delivery_type // ignore: cast_nullable_to_non_nullable
              as String,
      payment_id: null == payment_id
          ? _value.payment_id
          : payment_id // ignore: cast_nullable_to_non_nullable
              as String,
      payment_type: null == payment_type
          ? _value.payment_type
          : payment_type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderRequest implements _OrderRequest {
  _$_OrderRequest(
      {required final List<ProductWithCount> products,
      required this.user_name,
      required this.user_phone,
      required this.user_email,
      required this.delivery_id,
      required this.delivery_type,
      required this.payment_id,
      required this.payment_type})
      : _products = products;

  factory _$_OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$$_OrderRequestFromJson(json);

  final List<ProductWithCount> _products;
  @override
  List<ProductWithCount> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String user_name;
  @override
  final String user_phone;
  @override
  final String user_email;
  @override
  final String delivery_id;
  @override
  final String delivery_type;
  @override
  final String payment_id;
  @override
  final String payment_type;

  @override
  String toString() {
    return 'OrderRequest(products: $products, user_name: $user_name, user_phone: $user_phone, user_email: $user_email, delivery_id: $delivery_id, delivery_type: $delivery_type, payment_id: $payment_id, payment_type: $payment_type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderRequest &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.user_name, user_name) ||
                other.user_name == user_name) &&
            (identical(other.user_phone, user_phone) ||
                other.user_phone == user_phone) &&
            (identical(other.user_email, user_email) ||
                other.user_email == user_email) &&
            (identical(other.delivery_id, delivery_id) ||
                other.delivery_id == delivery_id) &&
            (identical(other.delivery_type, delivery_type) ||
                other.delivery_type == delivery_type) &&
            (identical(other.payment_id, payment_id) ||
                other.payment_id == payment_id) &&
            (identical(other.payment_type, payment_type) ||
                other.payment_type == payment_type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      user_name,
      user_phone,
      user_email,
      delivery_id,
      delivery_type,
      payment_id,
      payment_type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderRequestCopyWith<_$_OrderRequest> get copyWith =>
      __$$_OrderRequestCopyWithImpl<_$_OrderRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderRequestToJson(
      this,
    );
  }
}

abstract class _OrderRequest implements OrderRequest {
  factory _OrderRequest(
      {required final List<ProductWithCount> products,
      required final String user_name,
      required final String user_phone,
      required final String user_email,
      required final String delivery_id,
      required final String delivery_type,
      required final String payment_id,
      required final String payment_type}) = _$_OrderRequest;

  factory _OrderRequest.fromJson(Map<String, dynamic> json) =
      _$_OrderRequest.fromJson;

  @override
  List<ProductWithCount> get products;
  @override
  String get user_name;
  @override
  String get user_phone;
  @override
  String get user_email;
  @override
  String get delivery_id;
  @override
  String get delivery_type;
  @override
  String get payment_id;
  @override
  String get payment_type;
  @override
  @JsonKey(ignore: true)
  _$$_OrderRequestCopyWith<_$_OrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
