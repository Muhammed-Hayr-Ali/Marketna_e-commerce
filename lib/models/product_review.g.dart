// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductReview _$ProductReviewFromJson(Map<String, dynamic> json) =>
    ProductReview(
      comment: json['comment'] as String?,
      ratingValue: (json['ratingValue'] as num?)?.toDouble(),
      userProfiles:
          json['userProfiles'] == null
              ? null
              : UserProfile.fromJson(
                json['userProfiles'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ProductReviewToJson(ProductReview instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'ratingValue': instance.ratingValue,
      'userProfiles': instance.userProfiles,
    };
