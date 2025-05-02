// profiles.dart
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiles.freezed.dart';
part 'profiles.g.dart';

@freezed
class Profiles with _$Profiles {
  const factory Profiles({
    String? id,
    String? name,
    String? email,
    String? avatar,
    String? picture,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'preferred_username') String? preferredUsername,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Profiles;

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);

  static Profiles empty() => const Profiles();
}
