// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfilesImpl _$$ProfilesImplFromJson(Map<String, dynamic> json) =>
    _$ProfilesImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      picture: json['picture'] as String?,
      fullName: json['full_name'] as String?,
      userName: json['user_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      displayName: json['display_name'] as String?,
      preferredUsername: json['preferred_username'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$ProfilesImplToJson(_$ProfilesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'picture': instance.picture,
      'full_name': instance.fullName,
      'user_name': instance.userName,
      'avatar_url': instance.avatarUrl,
      'display_name': instance.displayName,
      'preferred_username': instance.preferredUsername,
      'created_at': instance.createdAt,
    };
