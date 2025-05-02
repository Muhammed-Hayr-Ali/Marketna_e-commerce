// product_model.dart
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    int? id,
    String? name,
    String? description,
    double? price,
    @JsonKey(name: 'old_price') double? oldPrice,
    @JsonKey(name: 'image_url') String? imageUrl,
    int? quantity,
    String? category,
    String? quality,
    @JsonKey(name: 'favorite_count') int? favoriteCount,
    @JsonKey(name: 'views_count') int? viewsCount,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  static ProductModel empty() => const ProductModel();

}
