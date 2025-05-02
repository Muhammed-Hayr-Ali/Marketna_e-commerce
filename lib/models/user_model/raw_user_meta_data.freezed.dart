// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_user_meta_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RawUserMetaData _$RawUserMetaDataFromJson(Map<String, dynamic> json) {
  return _RawUserMetaData.fromJson(json);
}

/// @nodoc
mixin _$RawUserMetaData {
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_birth')
  String? get dateBirth => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified')
  bool? get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_verified')
  bool? get phoneVerified => throw _privateConstructorUsedError;

  /// Serializes this RawUserMetaData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RawUserMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RawUserMetaDataCopyWith<RawUserMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawUserMetaDataCopyWith<$Res> {
  factory $RawUserMetaDataCopyWith(
    RawUserMetaData value,
    $Res Function(RawUserMetaData) then,
  ) = _$RawUserMetaDataCopyWithImpl<$Res, RawUserMetaData>;
  @useResult
  $Res call({
    @JsonKey(name: 'display_name') String? displayName,
    String? name,
    @JsonKey(name: 'user_name') String? userName,
    String? countryCode,
    String? phone,
    String? gender,
    @JsonKey(name: 'date_birth') String? dateBirth,
    String? avatar,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'email_verified') bool? emailVerified,
    @JsonKey(name: 'phone_verified') bool? phoneVerified,
  });
}

/// @nodoc
class _$RawUserMetaDataCopyWithImpl<$Res, $Val extends RawUserMetaData>
    implements $RawUserMetaDataCopyWith<$Res> {
  _$RawUserMetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RawUserMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? name = freezed,
    Object? userName = freezed,
    Object? countryCode = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? dateBirth = freezed,
    Object? avatar = freezed,
    Object? avatarUrl = freezed,
    Object? emailVerified = freezed,
    Object? phoneVerified = freezed,
  }) {
    return _then(
      _value.copyWith(
            displayName:
                freezed == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            userName:
                freezed == userName
                    ? _value.userName
                    : userName // ignore: cast_nullable_to_non_nullable
                        as String?,
            countryCode:
                freezed == countryCode
                    ? _value.countryCode
                    : countryCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            phone:
                freezed == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String?,
            gender:
                freezed == gender
                    ? _value.gender
                    : gender // ignore: cast_nullable_to_non_nullable
                        as String?,
            dateBirth:
                freezed == dateBirth
                    ? _value.dateBirth
                    : dateBirth // ignore: cast_nullable_to_non_nullable
                        as String?,
            avatar:
                freezed == avatar
                    ? _value.avatar
                    : avatar // ignore: cast_nullable_to_non_nullable
                        as String?,
            avatarUrl:
                freezed == avatarUrl
                    ? _value.avatarUrl
                    : avatarUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            emailVerified:
                freezed == emailVerified
                    ? _value.emailVerified
                    : emailVerified // ignore: cast_nullable_to_non_nullable
                        as bool?,
            phoneVerified:
                freezed == phoneVerified
                    ? _value.phoneVerified
                    : phoneVerified // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RawUserMetaDataImplCopyWith<$Res>
    implements $RawUserMetaDataCopyWith<$Res> {
  factory _$$RawUserMetaDataImplCopyWith(
    _$RawUserMetaDataImpl value,
    $Res Function(_$RawUserMetaDataImpl) then,
  ) = __$$RawUserMetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'display_name') String? displayName,
    String? name,
    @JsonKey(name: 'user_name') String? userName,
    String? countryCode,
    String? phone,
    String? gender,
    @JsonKey(name: 'date_birth') String? dateBirth,
    String? avatar,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'email_verified') bool? emailVerified,
    @JsonKey(name: 'phone_verified') bool? phoneVerified,
  });
}

/// @nodoc
class __$$RawUserMetaDataImplCopyWithImpl<$Res>
    extends _$RawUserMetaDataCopyWithImpl<$Res, _$RawUserMetaDataImpl>
    implements _$$RawUserMetaDataImplCopyWith<$Res> {
  __$$RawUserMetaDataImplCopyWithImpl(
    _$RawUserMetaDataImpl _value,
    $Res Function(_$RawUserMetaDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RawUserMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? name = freezed,
    Object? userName = freezed,
    Object? countryCode = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? dateBirth = freezed,
    Object? avatar = freezed,
    Object? avatarUrl = freezed,
    Object? emailVerified = freezed,
    Object? phoneVerified = freezed,
  }) {
    return _then(
      _$RawUserMetaDataImpl(
        displayName:
            freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        userName:
            freezed == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                    as String?,
        countryCode:
            freezed == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        phone:
            freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String?,
        gender:
            freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                    as String?,
        dateBirth:
            freezed == dateBirth
                ? _value.dateBirth
                : dateBirth // ignore: cast_nullable_to_non_nullable
                    as String?,
        avatar:
            freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                    as String?,
        avatarUrl:
            freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        emailVerified:
            freezed == emailVerified
                ? _value.emailVerified
                : emailVerified // ignore: cast_nullable_to_non_nullable
                    as bool?,
        phoneVerified:
            freezed == phoneVerified
                ? _value.phoneVerified
                : phoneVerified // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RawUserMetaDataImpl implements _RawUserMetaData {
  const _$RawUserMetaDataImpl({
    @JsonKey(name: 'display_name') this.displayName,
    this.name,
    @JsonKey(name: 'user_name') this.userName,
    this.countryCode,
    this.phone,
    this.gender,
    @JsonKey(name: 'date_birth') this.dateBirth,
    this.avatar,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    @JsonKey(name: 'email_verified') this.emailVerified,
    @JsonKey(name: 'phone_verified') this.phoneVerified,
  });

  factory _$RawUserMetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RawUserMetaDataImplFromJson(json);

  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  final String? name;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;
  @override
  final String? countryCode;
  @override
  final String? phone;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'date_birth')
  final String? dateBirth;
  @override
  final String? avatar;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'email_verified')
  final bool? emailVerified;
  @override
  @JsonKey(name: 'phone_verified')
  final bool? phoneVerified;

  @override
  String toString() {
    return 'RawUserMetaData(displayName: $displayName, name: $name, userName: $userName, countryCode: $countryCode, phone: $phone, gender: $gender, dateBirth: $dateBirth, avatar: $avatar, avatarUrl: $avatarUrl, emailVerified: $emailVerified, phoneVerified: $phoneVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RawUserMetaDataImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateBirth, dateBirth) ||
                other.dateBirth == dateBirth) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    displayName,
    name,
    userName,
    countryCode,
    phone,
    gender,
    dateBirth,
    avatar,
    avatarUrl,
    emailVerified,
    phoneVerified,
  );

  /// Create a copy of RawUserMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RawUserMetaDataImplCopyWith<_$RawUserMetaDataImpl> get copyWith =>
      __$$RawUserMetaDataImplCopyWithImpl<_$RawUserMetaDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RawUserMetaDataImplToJson(this);
  }
}

abstract class _RawUserMetaData implements RawUserMetaData {
  const factory _RawUserMetaData({
    @JsonKey(name: 'display_name') final String? displayName,
    final String? name,
    @JsonKey(name: 'user_name') final String? userName,
    final String? countryCode,
    final String? phone,
    final String? gender,
    @JsonKey(name: 'date_birth') final String? dateBirth,
    final String? avatar,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    @JsonKey(name: 'email_verified') final bool? emailVerified,
    @JsonKey(name: 'phone_verified') final bool? phoneVerified,
  }) = _$RawUserMetaDataImpl;

  factory _RawUserMetaData.fromJson(Map<String, dynamic> json) =
      _$RawUserMetaDataImpl.fromJson;

  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  String? get name;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;
  @override
  String? get countryCode;
  @override
  String? get phone;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'date_birth')
  String? get dateBirth;
  @override
  String? get avatar;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'email_verified')
  bool? get emailVerified;
  @override
  @JsonKey(name: 'phone_verified')
  bool? get phoneVerified;

  /// Create a copy of RawUserMetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RawUserMetaDataImplCopyWith<_$RawUserMetaDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
