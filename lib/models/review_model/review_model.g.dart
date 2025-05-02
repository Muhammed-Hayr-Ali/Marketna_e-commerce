// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      productId: (json['product_id'] as num?)?.toInt(),
      ratingValue: (json['rating_value'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      profiles:
          json['profiles'] == null
              ? null
              : Profiles.fromJson(json['profiles'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'product_id': instance.productId,
      'rating_value': instance.ratingValue,
      'comment': instance.comment,
      'profiles': instance.profiles,
      'created_at': instance.createdAt,
    };
