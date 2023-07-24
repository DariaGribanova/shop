// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductCart _$ProductCartFromJson(Map<String, dynamic> json) {
  return _ProductCart.fromJson(json);
}

/// @nodoc
mixin _$ProductCart {
  int get id => throw _privateConstructorUsedError;
  Decimal get price => throw _privateConstructorUsedError;
  String? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: "old_price")
  Decimal? get oldPrice => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get article => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  List<Badge> get badges => throw _privateConstructorUsedError;
  @JsonKey(name: "reviews_count")
  int? get reviewsCount => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCartCopyWith<ProductCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCartCopyWith<$Res> {
  factory $ProductCartCopyWith(
          ProductCart value, $Res Function(ProductCart) then) =
      _$ProductCartCopyWithImpl<$Res, ProductCart>;
  @useResult
  $Res call(
      {int id,
      Decimal price,
      String? discount,
      @JsonKey(name: "old_price") Decimal? oldPrice,
      String name,
      String? article,
      String picture,
      List<Badge> badges,
      @JsonKey(name: "reviews_count") int? reviewsCount,
      String brand});
}

/// @nodoc
class _$ProductCartCopyWithImpl<$Res, $Val extends ProductCart>
    implements $ProductCartCopyWith<$Res> {
  _$ProductCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? discount = freezed,
    Object? oldPrice = freezed,
    Object? name = null,
    Object? article = freezed,
    Object? picture = null,
    Object? badges = null,
    Object? reviewsCount = freezed,
    Object? brand = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Decimal,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<Badge>,
      reviewsCount: freezed == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductCartCopyWith<$Res>
    implements $ProductCartCopyWith<$Res> {
  factory _$$_ProductCartCopyWith(
          _$_ProductCart value, $Res Function(_$_ProductCart) then) =
      __$$_ProductCartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Decimal price,
      String? discount,
      @JsonKey(name: "old_price") Decimal? oldPrice,
      String name,
      String? article,
      String picture,
      List<Badge> badges,
      @JsonKey(name: "reviews_count") int? reviewsCount,
      String brand});
}

/// @nodoc
class __$$_ProductCartCopyWithImpl<$Res>
    extends _$ProductCartCopyWithImpl<$Res, _$_ProductCart>
    implements _$$_ProductCartCopyWith<$Res> {
  __$$_ProductCartCopyWithImpl(
      _$_ProductCart _value, $Res Function(_$_ProductCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? discount = freezed,
    Object? oldPrice = freezed,
    Object? name = null,
    Object? article = freezed,
    Object? picture = null,
    Object? badges = null,
    Object? reviewsCount = freezed,
    Object? brand = null,
  }) {
    return _then(_$_ProductCart(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Decimal,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<Badge>,
      reviewsCount: freezed == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductCart implements _ProductCart {
  const _$_ProductCart(
      {required this.id,
      required this.price,
      this.discount,
      @JsonKey(name: "old_price") this.oldPrice,
      required this.name,
      this.article,
      required this.picture,
      required final List<Badge> badges,
      @JsonKey(name: "reviews_count") this.reviewsCount,
      required this.brand})
      : _badges = badges;

  factory _$_ProductCart.fromJson(Map<String, dynamic> json) =>
      _$$_ProductCartFromJson(json);

  @override
  final int id;
  @override
  final Decimal price;
  @override
  final String? discount;
  @override
  @JsonKey(name: "old_price")
  final Decimal? oldPrice;
  @override
  final String name;
  @override
  final String? article;
  @override
  final String picture;
  final List<Badge> _badges;
  @override
  List<Badge> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  @JsonKey(name: "reviews_count")
  final int? reviewsCount;
  @override
  final String brand;

  @override
  String toString() {
    return 'ProductCart(id: $id, price: $price, discount: $discount, oldPrice: $oldPrice, name: $name, article: $article, picture: $picture, badges: $badges, reviewsCount: $reviewsCount, brand: $brand)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductCart &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.article, article) || other.article == article) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      discount,
      oldPrice,
      name,
      article,
      picture,
      const DeepCollectionEquality().hash(_badges),
      reviewsCount,
      brand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCartCopyWith<_$_ProductCart> get copyWith =>
      __$$_ProductCartCopyWithImpl<_$_ProductCart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductCartToJson(
      this,
    );
  }
}

abstract class _ProductCart implements ProductCart {
  const factory _ProductCart(
      {required final int id,
      required final Decimal price,
      final String? discount,
      @JsonKey(name: "old_price") final Decimal? oldPrice,
      required final String name,
      final String? article,
      required final String picture,
      required final List<Badge> badges,
      @JsonKey(name: "reviews_count") final int? reviewsCount,
      required final String brand}) = _$_ProductCart;

  factory _ProductCart.fromJson(Map<String, dynamic> json) =
      _$_ProductCart.fromJson;

  @override
  int get id;
  @override
  Decimal get price;
  @override
  String? get discount;
  @override
  @JsonKey(name: "old_price")
  Decimal? get oldPrice;
  @override
  String get name;
  @override
  String? get article;
  @override
  String get picture;
  @override
  List<Badge> get badges;
  @override
  @JsonKey(name: "reviews_count")
  int? get reviewsCount;
  @override
  String get brand;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCartCopyWith<_$_ProductCart> get copyWith =>
      throw _privateConstructorUsedError;
}
