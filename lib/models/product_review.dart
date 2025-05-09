// lib/models/product_review.dart
import 'package:json_annotation/json_annotation.dart';
import 'user_profile.dart';

part 'product_review.g.dart';

@JsonSerializable()
class ProductReview {
  @JsonKey(name: 'comment')
  final String? comment;

  @JsonKey(name: 'rating_value')
  final double? ratingValue;

  @JsonKey(name: 'user_profiles')
  final UserProfile? userProfiles;

  ProductReview({this.comment, this.ratingValue, this.userProfiles});

  factory ProductReview.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReviewToJson(this);
}
