// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      emailConfirmedAt: json['email_confirmed_at'] as String?,
      lastSignInAt: json['last_sign_in_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      rawUserMetaData:
          json['raw_user_meta_data'] == null
              ? null
              : RawUserMetaData.fromJson(
                json['raw_user_meta_data'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'email': instance.email,
      'email_confirmed_at': instance.emailConfirmedAt,
      'last_sign_in_at': instance.lastSignInAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'raw_user_meta_data': instance.rawUserMetaData,
    };
