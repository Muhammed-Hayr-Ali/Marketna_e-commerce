// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      email: json['email'] as String?,
      addressName: json['address_name'] as String?,
      country: json['country'] as String?,
      flag: json['flag'] as String?,
      province: json['province'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      countryCode: json['country_code'] as String?,
      phoneNumber: json['phone_number'] as String?,
      notes: json['notes'] as String?,
      location: json['location'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'email': instance.email,
      'address_name': instance.addressName,
      'country': instance.country,
      'flag': instance.flag,
      'province': instance.province,
      'city': instance.city,
      'street': instance.street,
      'country_code': instance.countryCode,
      'phone_number': instance.phoneNumber,
      'notes': instance.notes,
      'location': instance.location,
      'created_at': instance.createdAt,
    };
