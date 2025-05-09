// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductReview _$ProductReviewFromJson(Map<String, dynamic> json) =>
    ProductReview(
      comment: json['comment'] as String?,
      ratingValue: (json['rating_value'] as num?)?.toDouble(),
      userProfiles:
          json['user_profiles'] == null
              ? null
              : UserProfile.fromJson(
                json['user_profiles'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ProductReviewToJson(ProductReview instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'rating_value': instance.ratingValue,
      'user_profiles': instance.userProfiles,
    };
