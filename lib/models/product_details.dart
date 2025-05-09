// product_details.dart
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// نحتاج لاستيراد النماذج المرتبطة
import 'product_attribute.dart';
import 'category_model.dart';
import 'product_image.dart';
import 'product_review.dart';
import 'user_purchase.dart';

part 'product_details.freezed.dart';
part 'product_details.g.dart';

@freezed
class ProductDetails with _$ProductDetails {
  const factory ProductDetails({
    // الحقول العادية
    int? id,
    String? name,
    String? description,

    // التسعير
    @JsonKey(name: 'price') int? price,
    @JsonKey(name: 'old_price') double? oldPrice,

    // الكميات
    int? quantity,

    // الإحصائيات
    @JsonKey(name: 'favorite_count') int? favoriteCount,
    @JsonKey(name: 'views_count') int? viewsCount,

    // العلاقات
    @Default(<ProductAttribute>[])
    @JsonKey(name: 'product_attributes')
    List<ProductAttribute> productAttributes,

    @JsonKey(name: 'product_categories') CategoryModel? productCategories,

    @JsonKey(name: 'product_quality') CategoryModel? productQuality,

    @Default(<ProductImage>[])
    @JsonKey(name: 'products_images')
    List<ProductImage> productsImages,

    @Default(<ProductReview>[])
    @JsonKey(name: 'products_reviews')
    List<ProductReview> productsReviews,

    @Default(<UserPurchase>[])
    @JsonKey(name: 'user_purchases')
    List<UserPurchase> userPurchases,
  }) = _ProductDetails;

  factory ProductDetails.fromJson(Map<String, Object?> json) =>
      _$ProductDetailsFromJson(json);
}
