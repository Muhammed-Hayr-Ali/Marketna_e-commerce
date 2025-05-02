// province.dart
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'city.dart'; // استيراد الكلاس الفرعي

part 'province.freezed.dart';
part 'province.g.dart';

@freezed
class Province with _$Province {
  const factory Province({
    int? id,
    String? name,
    @JsonKey(name: 'name_ar') String? nameAr,
    @JsonKey(name: 'country_id') int? countryId,
    List<City>? city,
  }) = _Province;

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  static Province empty() => const Province();

}
