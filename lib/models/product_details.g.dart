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
      oldPrice: (json['old_price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      favoriteCount: (json['favorite_count'] as num?)?.toInt(),
      viewsCount: (json['views_count'] as num?)?.toInt(),
      productAttributes:
          (json['product_attributes'] as List<dynamic>?)
              ?.map((e) => ProductAttribute.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductAttribute>[],
      productCategories:
          json['product_categories'] == null
              ? null
              : CategoryModel.fromJson(
                json['product_categories'] as Map<String, dynamic>,
              ),
      productQuality:
          json['product_quality'] == null
              ? null
              : CategoryModel.fromJson(
                json['product_quality'] as Map<String, dynamic>,
              ),
      productsImages:
          (json['products_images'] as List<dynamic>?)
              ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductImage>[],
      productsReviews:
          (json['products_reviews'] as List<dynamic>?)
              ?.map((e) => ProductReview.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductReview>[],
      userPurchases:
          (json['user_purchases'] as List<dynamic>?)
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
  'old_price': instance.oldPrice,
  'quantity': instance.quantity,
  'favorite_count': instance.favoriteCount,
  'views_count': instance.viewsCount,
  'product_attributes': instance.productAttributes,
  'product_categories': instance.productCategories,
  'product_quality': instance.productQuality,
  'products_images': instance.productsImages,
  'products_reviews': instance.productsReviews,
  'user_purchases': instance.userPurchases,
};
