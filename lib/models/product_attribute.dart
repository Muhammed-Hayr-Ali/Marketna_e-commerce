// lib/models/product_attribute.dart
import 'package:json_annotation/json_annotation.dart';

part 'product_attribute.g.dart';

@JsonSerializable()
class ProductAttribute {
  final String key;
  final String value;

  ProductAttribute({required this.key, required this.value});

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAttributeToJson(this);
}
