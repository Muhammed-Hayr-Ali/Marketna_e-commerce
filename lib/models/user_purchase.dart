// lib/models/user_purchase.dart
import 'package:json_annotation/json_annotation.dart';

part 'user_purchase.g.dart';

@JsonSerializable()
class UserPurchase {
  final String? userId;

  UserPurchase({this.userId});

  factory UserPurchase.fromJson(Map<String, dynamic> json) =>
      _$UserPurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$UserPurchaseToJson(this);
}
