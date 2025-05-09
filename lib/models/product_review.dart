// lib/models/product_review.dart
import 'package:json_annotation/json_annotation.dart';
import 'user_profile.dart';

part 'product_review.g.dart';

@JsonSerializable()
class ProductReview {
  final String? comment;
  final double? ratingValue;
  final UserProfile? userProfiles;

  ProductReview({this.comment, this.ratingValue, this.userProfiles});

  factory ProductReview.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReviewToJson(this);
}
