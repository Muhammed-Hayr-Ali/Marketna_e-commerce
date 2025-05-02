// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return _CountryModel.fromJson(json);
}

/// @nodoc
mixin _$CountryModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_ar')
  String? get nameAr => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  @JsonKey(name: 'emojiU')
  String? get emojiU => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get isoCode => throw _privateConstructorUsedError;
  String? get flag => throw _privateConstructorUsedError;
  List<Province>? get province => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CountryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryModelCopyWith<CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
    CountryModel value,
    $Res Function(CountryModel) then,
  ) = _$CountryModelCopyWithImpl<$Res, CountryModel>;
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res, $Val extends CountryModel>
    implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nameAr = freezed,
    Object? emoji = freezed,
    Object? emojiU = freezed,
    Object? code = freezed,
    Object? isoCode = freezed,
    Object? flag = freezed,
    Object? province = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            nameAr:
                freezed == nameAr
                    ? _value.nameAr
                    : nameAr // ignore: cast_nullable_to_non_nullable
                        as String?,
            emoji:
                freezed == emoji
                    ? _value.emoji
                    : emoji // ignore: cast_nullable_to_non_nullable
                        as String?,
            emojiU:
                freezed == emojiU
                    ? _value.emojiU
                    : emojiU // ignore: cast_nullable_to_non_nullable
                        as String?,
            code:
                freezed == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String?,
            isoCode:
                freezed == isoCode
                    ? _value.isoCode
                    : isoCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            flag:
                freezed == flag
                    ? _value.flag
                    : flag // ignore: cast_nullable_to_non_nullable
                        as String?,
            province:
                freezed == province
                    ? _value.province
                    : province // ignore: cast_nullable_to_non_nullable
                        as List<Province>?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CountryModelImplCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$$CountryModelImplCopyWith(
    _$CountryModelImpl value,
    $Res Function(_$CountryModelImpl) then,
  ) = __$$CountryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class __$$CountryModelImplCopyWithImpl<$Res>
    extends _$CountryModelCopyWithImpl<$Res, _$CountryModelImpl>
    implements _$$CountryModelImplCopyWith<$Res> {
  __$$CountryModelImplCopyWithImpl(
    _$CountryModelImpl _value,
    $Res Function(_$CountryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nameAr = freezed,
    Object? emoji = freezed,
    Object? emojiU = freezed,
    Object? code = freezed,
    Object? isoCode = freezed,
    Object? flag = freezed,
    Object? province = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$CountryModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        nameAr:
            freezed == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                    as String?,
        emoji:
            freezed == emoji
                ? _value.emoji
                : emoji // ignore: cast_nullable_to_non_nullable
                    as String?,
        emojiU:
            freezed == emojiU
                ? _value.emojiU
                : emojiU // ignore: cast_nullable_to_non_nullable
                    as String?,
        code:
            freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as String?,
        isoCode:
            freezed == isoCode
                ? _value.isoCode
                : isoCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        flag:
            freezed == flag
                ? _value.flag
                : flag // ignore: cast_nullable_to_non_nullable
                    as String?,
        province:
            freezed == province
                ? _value._province
                : province // ignore: cast_nullable_to_non_nullable
                    as List<Province>?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryModelImpl implements _CountryModel {
  const _$CountryModelImpl({
    this.id,
    this.name,
    @JsonKey(name: 'name_ar') this.nameAr,
    this.emoji,
    @JsonKey(name: 'emojiU') this.emojiU,
    this.code,
    this.isoCode,
    this.flag,
    final List<Province>? province,
    @JsonKey(name: 'created_at') this.createdAt,
  }) : _province = province;

  factory _$CountryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @override
  final String? emoji;
  @override
  @JsonKey(name: 'emojiU')
  final String? emojiU;
  @override
  final String? code;
  @override
  final String? isoCode;
  @override
  final String? flag;
  final List<Province>? _province;
  @override
  List<Province>? get province {
    final value = _province;
    if (value == null) return null;
    if (_province is EqualUnmodifiableListView) return _province;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, nameAr: $nameAr, emoji: $emoji, emojiU: $emojiU, code: $code, isoCode: $isoCode, flag: $flag, province: $province, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.emojiU, emojiU) || other.emojiU == emojiU) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isoCode, isoCode) || other.isoCode == isoCode) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            const DeepCollectionEquality().equals(other._province, _province) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    nameAr,
    emoji,
    emojiU,
    code,
    isoCode,
    flag,
    const DeepCollectionEquality().hash(_province),
    createdAt,
  );

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      __$$CountryModelImplCopyWithImpl<_$CountryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryModelImplToJson(this);
  }
}

abstract class _CountryModel implements CountryModel {
  const factory _CountryModel({
    final int? id,
    final String? name,
    @JsonKey(name: 'name_ar') final String? nameAr,
    final String? emoji,
    @JsonKey(name: 'emojiU') final String? emojiU,
    final String? code,
    final String? isoCode,
    final String? flag,
    final List<Province>? province,
    @JsonKey(name: 'created_at') final String? createdAt,
  }) = _$CountryModelImpl;

  factory _CountryModel.fromJson(Map<String, dynamic> json) =
      _$CountryModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'name_ar')
  String? get nameAr;
  @override
  String? get emoji;
  @override
  @JsonKey(name: 'emojiU')
  String? get emojiU;
  @override
  String? get code;
  @override
  String? get isoCode;
  @override
  String? get flag;
  @override
  List<Province>? get province;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
