// product_details.dart
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
    int? id,
    String? name,
    String? description,
    int? price,
    double? oldPrice,
    int? quantity,
    int? favoriteCount,
    int? viewsCount,

    @Default(<ProductAttribute>[]) List<ProductAttribute> productAttributes,
    CategoryModel? productCategories,
    CategoryModel? productQuality,
    @Default(<ProductImage>[]) List<ProductImage> productsImages,
    @Default(<ProductReview>[]) List<ProductReview> productsReviews,
    @Default(<UserPurchase>[]) List<UserPurchase> userPurchases,
  }) = _ProductDetails;

  factory ProductDetails.fromJson(Map<String, Object?> json) =>
      _$ProductDetailsFromJson(json);
}
