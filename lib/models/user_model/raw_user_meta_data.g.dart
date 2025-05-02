// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_user_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RawUserMetaDataImpl _$$RawUserMetaDataImplFromJson(
  Map<String, dynamic> json,
) => _$RawUserMetaDataImpl(
  displayName: json['display_name'] as String?,
  name: json['name'] as String?,
  userName: json['user_name'] as String?,
  countryCode: json['countryCode'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
  dateBirth: json['date_birth'] as String?,
  avatar: json['avatar'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  emailVerified: json['email_verified'] as bool?,
  phoneVerified: json['phone_verified'] as bool?,
);

Map<String, dynamic> _$$RawUserMetaDataImplToJson(
  _$RawUserMetaDataImpl instance,
) => <String, dynamic>{
  'display_name': instance.displayName,
  'name': instance.name,
  'user_name': instance.userName,
  'countryCode': instance.countryCode,
  'phone': instance.phone,
  'gender': instance.gender,
  'date_birth': instance.dateBirth,
  'avatar': instance.avatar,
  'avatar_url': instance.avatarUrl,
  'email_verified': instance.emailVerified,
  'phone_verified': instance.phoneVerified,
};
