// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryModelImpl _$$CountryModelImplFromJson(Map<String, dynamic> json) =>
    _$CountryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameAr: json['name_ar'] as String?,
      emoji: json['emoji'] as String?,
      emojiU: json['emojiU'] as String?,
      code: json['code'] as String?,
      isoCode: json['isoCode'] as String?,
      flag: json['flag'] as String?,
      province:
          (json['province'] as List<dynamic>?)
              ?.map((e) => Province.fromJson(e as Map<String, dynamic>))
              .toList(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$CountryModelImplToJson(_$CountryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_ar': instance.nameAr,
      'emoji': instance.emoji,
      'emojiU': instance.emojiU,
      'code': instance.code,
      'isoCode': instance.isoCode,
      'flag': instance.flag,
      'province': instance.province,
      'created_at': instance.createdAt,
    };
