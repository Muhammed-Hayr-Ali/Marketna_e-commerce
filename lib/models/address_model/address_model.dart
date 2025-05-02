// address_model.dart
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    int? id,
    @JsonKey(name: 'user_id') String? userId,
    String? email,
    @JsonKey(name: 'address_name') String? addressName,
    String? country,
    String? flag,
    String? province,
    String? city,
    String? street,
    @JsonKey(name: 'country_code') String? countryCode,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? notes,
    Map<String, dynamic>? location,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

      static AddressModel empty() => const AddressModel();
}
