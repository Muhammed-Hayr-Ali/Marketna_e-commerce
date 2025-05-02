// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_name')
  String? get addressName => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get flag => throw _privateConstructorUsedError;
  String? get province => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
    AddressModel value,
    $Res Function(AddressModel) then,
  ) = _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? email = freezed,
    Object? addressName = freezed,
    Object? country = freezed,
    Object? flag = freezed,
    Object? province = freezed,
    Object? city = freezed,
    Object? street = freezed,
    Object? countryCode = freezed,
    Object? phoneNumber = freezed,
    Object? notes = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            userId:
                freezed == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            addressName:
                freezed == addressName
                    ? _value.addressName
                    : addressName // ignore: cast_nullable_to_non_nullable
                        as String?,
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
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
                        as String?,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String?,
            street:
                freezed == street
                    ? _value.street
                    : street // ignore: cast_nullable_to_non_nullable
                        as String?,
            countryCode:
                freezed == countryCode
                    ? _value.countryCode
                    : countryCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            phoneNumber:
                freezed == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
            location:
                freezed == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>?,
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
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
    _$AddressModelImpl value,
    $Res Function(_$AddressModelImpl) then,
  ) = __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
    _$AddressModelImpl _value,
    $Res Function(_$AddressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? email = freezed,
    Object? addressName = freezed,
    Object? country = freezed,
    Object? flag = freezed,
    Object? province = freezed,
    Object? city = freezed,
    Object? street = freezed,
    Object? countryCode = freezed,
    Object? phoneNumber = freezed,
    Object? notes = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$AddressModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        userId:
            freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        addressName:
            freezed == addressName
                ? _value.addressName
                : addressName // ignore: cast_nullable_to_non_nullable
                    as String?,
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
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
                    as String?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
        street:
            freezed == street
                ? _value.street
                : street // ignore: cast_nullable_to_non_nullable
                    as String?,
        countryCode:
            freezed == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        phoneNumber:
            freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
        location:
            freezed == location
                ? _value._location
                : location // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>?,
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
class _$AddressModelImpl implements _AddressModel {
  const _$AddressModelImpl({
    this.id,
    @JsonKey(name: 'user_id') this.userId,
    this.email,
    @JsonKey(name: 'address_name') this.addressName,
    this.country,
    this.flag,
    this.province,
    this.city,
    this.street,
    @JsonKey(name: 'country_code') this.countryCode,
    @JsonKey(name: 'phone_number') this.phoneNumber,
    this.notes,
    final Map<String, dynamic>? location,
    @JsonKey(name: 'created_at') this.createdAt,
  }) : _location = location;

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? email;
  @override
  @JsonKey(name: 'address_name')
  final String? addressName;
  @override
  final String? country;
  @override
  final String? flag;
  @override
  final String? province;
  @override
  final String? city;
  @override
  final String? street;
  @override
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  final String? notes;
  final Map<String, dynamic>? _location;
  @override
  Map<String, dynamic>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableMapView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'AddressModel(id: $id, userId: $userId, email: $email, addressName: $addressName, country: $country, flag: $flag, province: $province, city: $city, street: $street, countryCode: $countryCode, phoneNumber: $phoneNumber, notes: $notes, location: $location, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    email,
    addressName,
    country,
    flag,
    province,
    city,
    street,
    countryCode,
    phoneNumber,
    notes,
    const DeepCollectionEquality().hash(_location),
    createdAt,
  );

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(this);
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel({
    final int? id,
    @JsonKey(name: 'user_id') final String? userId,
    final String? email,
    @JsonKey(name: 'address_name') final String? addressName,
    final String? country,
    final String? flag,
    final String? province,
    final String? city,
    final String? street,
    @JsonKey(name: 'country_code') final String? countryCode,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
    final String? notes,
    final Map<String, dynamic>? location,
    @JsonKey(name: 'created_at') final String? createdAt,
  }) = _$AddressModelImpl;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get email;
  @override
  @JsonKey(name: 'address_name')
  String? get addressName;
  @override
  String? get country;
  @override
  String? get flag;
  @override
  String? get province;
  @override
  String? get city;
  @override
  String? get street;
  @override
  @JsonKey(name: 'country_code')
  String? get countryCode;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  String? get notes;
  @override
  Map<String, dynamic>? get location;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
