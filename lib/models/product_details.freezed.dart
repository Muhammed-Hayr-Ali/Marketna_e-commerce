// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) {
  return _ProductDetails.fromJson(json);
}

/// @nodoc
mixin _$ProductDetails {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  double? get oldPrice => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  int? get favoriteCount => throw _privateConstructorUsedError;
  int? get viewsCount => throw _privateConstructorUsedError;
  List<ProductAttribute> get productAttributes =>
      throw _privateConstructorUsedError;
  CategoryModel? get productCategories => throw _privateConstructorUsedError;
  CategoryModel? get productQuality => throw _privateConstructorUsedError;
  List<ProductImage> get productsImages => throw _privateConstructorUsedError;
  List<ProductReview> get productsReviews => throw _privateConstructorUsedError;
  List<UserPurchase> get userPurchases => throw _privateConstructorUsedError;

  /// Serializes this ProductDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDetailsCopyWith<ProductDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsCopyWith<$Res> {
  factory $ProductDetailsCopyWith(
    ProductDetails value,
    $Res Function(ProductDetails) then,
  ) = _$ProductDetailsCopyWithImpl<$Res, ProductDetails>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? description,
    int? price,
    double? oldPrice,
    int? quantity,
    int? favoriteCount,
    int? viewsCount,
    List<ProductAttribute> productAttributes,
    CategoryModel? productCategories,
    CategoryModel? productQuality,
    List<ProductImage> productsImages,
    List<ProductReview> productsReviews,
    List<UserPurchase> userPurchases,
  });
}

/// @nodoc
class _$ProductDetailsCopyWithImpl<$Res, $Val extends ProductDetails>
    implements $ProductDetailsCopyWith<$Res> {
  _$ProductDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? oldPrice = freezed,
    Object? quantity = freezed,
    Object? favoriteCount = freezed,
    Object? viewsCount = freezed,
    Object? productAttributes = null,
    Object? productCategories = freezed,
    Object? productQuality = freezed,
    Object? productsImages = null,
    Object? productsReviews = null,
    Object? userPurchases = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as int?,
            oldPrice:
                freezed == oldPrice
                    ? _value.oldPrice
                    : oldPrice // ignore: cast_nullable_to_non_nullable
                        as double?,
            quantity:
                freezed == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as int?,
            favoriteCount:
                freezed == favoriteCount
                    ? _value.favoriteCount
                    : favoriteCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            viewsCount:
                freezed == viewsCount
                    ? _value.viewsCount
                    : viewsCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            productAttributes:
                null == productAttributes
                    ? _value.productAttributes
                    : productAttributes // ignore: cast_nullable_to_non_nullable
                        as List<ProductAttribute>,
            productCategories:
                freezed == productCategories
                    ? _value.productCategories
                    : productCategories // ignore: cast_nullable_to_non_nullable
                        as CategoryModel?,
            productQuality:
                freezed == productQuality
                    ? _value.productQuality
                    : productQuality // ignore: cast_nullable_to_non_nullable
                        as CategoryModel?,
            productsImages:
                null == productsImages
                    ? _value.productsImages
                    : productsImages // ignore: cast_nullable_to_non_nullable
                        as List<ProductImage>,
            productsReviews:
                null == productsReviews
                    ? _value.productsReviews
                    : productsReviews // ignore: cast_nullable_to_non_nullable
                        as List<ProductReview>,
            userPurchases:
                null == userPurchases
                    ? _value.userPurchases
                    : userPurchases // ignore: cast_nullable_to_non_nullable
                        as List<UserPurchase>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductDetailsImplCopyWith<$Res>
    implements $ProductDetailsCopyWith<$Res> {
  factory _$$ProductDetailsImplCopyWith(
    _$ProductDetailsImpl value,
    $Res Function(_$ProductDetailsImpl) then,
  ) = __$$ProductDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? description,
    int? price,
    double? oldPrice,
    int? quantity,
    int? favoriteCount,
    int? viewsCount,
    List<ProductAttribute> productAttributes,
    CategoryModel? productCategories,
    CategoryModel? productQuality,
    List<ProductImage> productsImages,
    List<ProductReview> productsReviews,
    List<UserPurchase> userPurchases,
  });
}

/// @nodoc
class __$$ProductDetailsImplCopyWithImpl<$Res>
    extends _$ProductDetailsCopyWithImpl<$Res, _$ProductDetailsImpl>
    implements _$$ProductDetailsImplCopyWith<$Res> {
  __$$ProductDetailsImplCopyWithImpl(
    _$ProductDetailsImpl _value,
    $Res Function(_$ProductDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? oldPrice = freezed,
    Object? quantity = freezed,
    Object? favoriteCount = freezed,
    Object? viewsCount = freezed,
    Object? productAttributes = null,
    Object? productCategories = freezed,
    Object? productQuality = freezed,
    Object? productsImages = null,
    Object? productsReviews = null,
    Object? userPurchases = null,
  }) {
    return _then(
      _$ProductDetailsImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as int?,
        oldPrice:
            freezed == oldPrice
                ? _value.oldPrice
                : oldPrice // ignore: cast_nullable_to_non_nullable
                    as double?,
        quantity:
            freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as int?,
        favoriteCount:
            freezed == favoriteCount
                ? _value.favoriteCount
                : favoriteCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        viewsCount:
            freezed == viewsCount
                ? _value.viewsCount
                : viewsCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        productAttributes:
            null == productAttributes
                ? _value._productAttributes
                : productAttributes // ignore: cast_nullable_to_non_nullable
                    as List<ProductAttribute>,
        productCategories:
            freezed == productCategories
                ? _value.productCategories
                : productCategories // ignore: cast_nullable_to_non_nullable
                    as CategoryModel?,
        productQuality:
            freezed == productQuality
                ? _value.productQuality
                : productQuality // ignore: cast_nullable_to_non_nullable
                    as CategoryModel?,
        productsImages:
            null == productsImages
                ? _value._productsImages
                : productsImages // ignore: cast_nullable_to_non_nullable
                    as List<ProductImage>,
        productsReviews:
            null == productsReviews
                ? _value._productsReviews
                : productsReviews // ignore: cast_nullable_to_non_nullable
                    as List<ProductReview>,
        userPurchases:
            null == userPurchases
                ? _value._userPurchases
                : userPurchases // ignore: cast_nullable_to_non_nullable
                    as List<UserPurchase>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDetailsImpl
    with DiagnosticableTreeMixin
    implements _ProductDetails {
  const _$ProductDetailsImpl({
    this.id,
    this.name,
    this.description,
    this.price,
    this.oldPrice,
    this.quantity,
    this.favoriteCount,
    this.viewsCount,
    final List<ProductAttribute> productAttributes = const <ProductAttribute>[],
    this.productCategories,
    this.productQuality,
    final List<ProductImage> productsImages = const <ProductImage>[],
    final List<ProductReview> productsReviews = const <ProductReview>[],
    final List<UserPurchase> userPurchases = const <UserPurchase>[],
  }) : _productAttributes = productAttributes,
       _productsImages = productsImages,
       _productsReviews = productsReviews,
       _userPurchases = userPurchases;

  factory _$ProductDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDetailsImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? price;
  @override
  final double? oldPrice;
  @override
  final int? quantity;
  @override
  final int? favoriteCount;
  @override
  final int? viewsCount;
  final List<ProductAttribute> _productAttributes;
  @override
  @JsonKey()
  List<ProductAttribute> get productAttributes {
    if (_productAttributes is EqualUnmodifiableListView)
      return _productAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productAttributes);
  }

  @override
  final CategoryModel? productCategories;
  @override
  final CategoryModel? productQuality;
  final List<ProductImage> _productsImages;
  @override
  @JsonKey()
  List<ProductImage> get productsImages {
    if (_productsImages is EqualUnmodifiableListView) return _productsImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsImages);
  }

  final List<ProductReview> _productsReviews;
  @override
  @JsonKey()
  List<ProductReview> get productsReviews {
    if (_productsReviews is EqualUnmodifiableListView) return _productsReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsReviews);
  }

  final List<UserPurchase> _userPurchases;
  @override
  @JsonKey()
  List<UserPurchase> get userPurchases {
    if (_userPurchases is EqualUnmodifiableListView) return _userPurchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userPurchases);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductDetails(id: $id, name: $name, description: $description, price: $price, oldPrice: $oldPrice, quantity: $quantity, favoriteCount: $favoriteCount, viewsCount: $viewsCount, productAttributes: $productAttributes, productCategories: $productCategories, productQuality: $productQuality, productsImages: $productsImages, productsReviews: $productsReviews, userPurchases: $userPurchases)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductDetails'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('oldPrice', oldPrice))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('favoriteCount', favoriteCount))
      ..add(DiagnosticsProperty('viewsCount', viewsCount))
      ..add(DiagnosticsProperty('productAttributes', productAttributes))
      ..add(DiagnosticsProperty('productCategories', productCategories))
      ..add(DiagnosticsProperty('productQuality', productQuality))
      ..add(DiagnosticsProperty('productsImages', productsImages))
      ..add(DiagnosticsProperty('productsReviews', productsReviews))
      ..add(DiagnosticsProperty('userPurchases', userPurchases));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.favoriteCount, favoriteCount) ||
                other.favoriteCount == favoriteCount) &&
            (identical(other.viewsCount, viewsCount) ||
                other.viewsCount == viewsCount) &&
            const DeepCollectionEquality().equals(
              other._productAttributes,
              _productAttributes,
            ) &&
            (identical(other.productCategories, productCategories) ||
                other.productCategories == productCategories) &&
            (identical(other.productQuality, productQuality) ||
                other.productQuality == productQuality) &&
            const DeepCollectionEquality().equals(
              other._productsImages,
              _productsImages,
            ) &&
            const DeepCollectionEquality().equals(
              other._productsReviews,
              _productsReviews,
            ) &&
            const DeepCollectionEquality().equals(
              other._userPurchases,
              _userPurchases,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    price,
    oldPrice,
    quantity,
    favoriteCount,
    viewsCount,
    const DeepCollectionEquality().hash(_productAttributes),
    productCategories,
    productQuality,
    const DeepCollectionEquality().hash(_productsImages),
    const DeepCollectionEquality().hash(_productsReviews),
    const DeepCollectionEquality().hash(_userPurchases),
  );

  /// Create a copy of ProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailsImplCopyWith<_$ProductDetailsImpl> get copyWith =>
      __$$ProductDetailsImplCopyWithImpl<_$ProductDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDetailsImplToJson(this);
  }
}

abstract class _ProductDetails implements ProductDetails {
  const factory _ProductDetails({
    final int? id,
    final String? name,
    final String? description,
    final int? price,
    final double? oldPrice,
    final int? quantity,
    final int? favoriteCount,
    final int? viewsCount,
    final List<ProductAttribute> productAttributes,
    final CategoryModel? productCategories,
    final CategoryModel? productQuality,
    final List<ProductImage> productsImages,
    final List<ProductReview> productsReviews,
    final List<UserPurchase> userPurchases,
  }) = _$ProductDetailsImpl;

  factory _ProductDetails.fromJson(Map<String, dynamic> json) =
      _$ProductDetailsImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  int? get price;
  @override
  double? get oldPrice;
  @override
  int? get quantity;
  @override
  int? get favoriteCount;
  @override
  int? get viewsCount;
  @override
  List<ProductAttribute> get productAttributes;
  @override
  CategoryModel? get productCategories;
  @override
  CategoryModel? get productQuality;
  @override
  List<ProductImage> get productsImages;
  @override
  List<ProductReview> get productsReviews;
  @override
  List<UserPurchase> get userPurchases;

  /// Create a copy of ProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDetailsImplCopyWith<_$ProductDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
