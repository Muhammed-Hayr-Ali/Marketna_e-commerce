// country_model.dart
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'province.dart'; // تأكد من استيراد الكلاسات الفرعية

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    int? id,
    String? name,
    @JsonKey(name: 'name_ar') String? nameAr,
    String? emoji,
    @JsonKey(name: 'emojiU') String? emojiU,
    String? code,
    String? isoCode,
    String? flag,
    List<Province>? province,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  static CountryModel empty() => const CountryModel();
}
