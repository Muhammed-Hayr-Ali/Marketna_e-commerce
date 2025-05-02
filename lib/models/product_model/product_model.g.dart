// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      oldPrice: (json['old_price'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      category: json['category'] as String?,
      quality: json['quality'] as String?,
      favoriteCount: (json['favorite_count'] as num?)?.toInt(),
      viewsCount: (json['views_count'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'image_url': instance.imageUrl,
      'quantity': instance.quantity,
      'category': instance.category,
      'quality': instance.quality,
      'favorite_count': instance.favoriteCount,
      'views_count': instance.viewsCount,
      'created_at': instance.createdAt,
    };
