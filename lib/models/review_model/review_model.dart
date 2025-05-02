// review_model.dart
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'profiles.dart'; // Make sure to import Profiles

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    int? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'rating_value') double? ratingValue,
    String? comment,
    Profiles? profiles,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  static ReviewModel empty() => const ReviewModel();
}
