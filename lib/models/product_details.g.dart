// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailsImpl _$$ProductDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ProductDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      favoriteCount: (json['favoriteCount'] as num?)?.toInt(),
      viewsCount: (json['viewsCount'] as num?)?.toInt(),
      productAttributes:
          (json['productAttributes'] as List<dynamic>?)
              ?.map((e) => ProductAttribute.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductAttribute>[],
      productCategories:
          json['productCategories'] == null
              ? null
              : CategoryModel.fromJson(
                json['productCategories'] as Map<String, dynamic>,
              ),
      productQuality:
          json['productQuality'] == null
              ? null
              : CategoryModel.fromJson(
                json['productQuality'] as Map<String, dynamic>,
              ),
      productsImages:
          (json['productsImages'] as List<dynamic>?)
              ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductImage>[],
      productsReviews:
          (json['productsReviews'] as List<dynamic>?)
              ?.map((e) => ProductReview.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductReview>[],
      userPurchases:
          (json['userPurchases'] as List<dynamic>?)
              ?.map((e) => UserPurchase.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UserPurchase>[],
    );

Map<String, dynamic> _$$ProductDetailsImplToJson(
  _$ProductDetailsImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'oldPrice': instance.oldPrice,
  'quantity': instance.quantity,
  'favoriteCount': instance.favoriteCount,
  'viewsCount': instance.viewsCount,
  'productAttributes': instance.productAttributes,
  'productCategories': instance.productCategories,
  'productQuality': instance.productQuality,
  'productsImages': instance.productsImages,
  'productsReviews': instance.productsReviews,
  'userPurchases': instance.userPurchases,
};
