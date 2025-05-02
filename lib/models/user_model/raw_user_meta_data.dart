// raw_user_meta_data.dart

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'raw_user_meta_data.freezed.dart';
part 'raw_user_meta_data.g.dart';

@freezed
class RawUserMetaData with _$RawUserMetaData {
  const factory RawUserMetaData({
    @JsonKey(name: 'display_name') String? displayName,
    String? name,
    @JsonKey(name: 'user_name') String? userName,
    String? countryCode,
    String? phone,
    String? gender,
    @JsonKey(name: 'date_birth') String? dateBirth,
    String? avatar,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'email_verified') bool? emailVerified,
    @JsonKey(name: 'phone_verified') bool? phoneVerified,
  }) = _RawUserMetaData;

  factory RawUserMetaData.fromJson(Map<String, dynamic> json) =>
      _$RawUserMetaDataFromJson(json);

  static RawUserMetaData empty() => const RawUserMetaData();

}
