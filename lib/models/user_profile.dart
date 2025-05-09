// lib/models/user_profile.dart
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  final String? userId;
  final String? fullName;
  final String? avatarUrl;

  UserProfile({this.userId, this.fullName, this.avatarUrl});

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
