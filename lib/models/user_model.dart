class User {
  String? id;
  String? role;
  String? email;
  String? emailConfirmedAt;
  String? lastSignInAt;
  String? createdAt;
  String? updatedAt;
  RawUserMetaData? rawUserMetaData;

  User({
    this.id,
    this.role,
    this.email,
    this.emailConfirmedAt,
    this.lastSignInAt,
    this.createdAt,
    this.updatedAt,
    this.rawUserMetaData,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    email = json['email'];
    emailConfirmedAt = json['email_confirmed_at'];
    lastSignInAt = json['last_sign_in_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rawUserMetaData =
        json['raw_user_meta_data'] != null
            ? RawUserMetaData.fromJson(json['raw_user_meta_data'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['email'] = email;
    data['email_confirmed_at'] = emailConfirmedAt;
    data['last_sign_in_at'] = lastSignInAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (rawUserMetaData != null) {
      data['raw_user_meta_data'] = rawUserMetaData!.toJson();
    }

    return data;
  }
}

class RawUserMetaData {
  String? displayName;
  String? name;
  String? userName;
  String? countryCode;
  String? phone;
  String? gender;
  String? dateBirth;
  String? avatar;
  String? avatarUrl;
  bool? emailVerified;
  bool? phoneVerified;

  RawUserMetaData({
    this.displayName,
    this.name,
    this.userName,
    this.countryCode,
    this.phone,
    this.gender,
    this.dateBirth,
    this.avatar,
    this.avatarUrl,
    this.emailVerified,
    this.phoneVerified,
  });

  RawUserMetaData.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    name = json['name'];
    userName = json['user_name'];
    countryCode = json['countryCode'];
    phone = json['phone'];
    gender = json['gender'];
    dateBirth = json['date_birth'];
    avatar = json['avatar'];
    avatarUrl = json['avatar_url'];
    emailVerified = json['email_verified'];
    phoneVerified = json['phone_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['display_name'] = displayName;
    data['name'] = name;
    data['user_name'] = userName;
    data['countryCode'] = countryCode;
    data['phone'] = phone;
    data['gender'] = gender;
    data['date_birth'] = dateBirth;
    data['avatar'] = avatar;
    data['avatar_url'] = avatarUrl;
    data['email_verified'] = emailVerified;
    data['phone_verified'] = phoneVerified;
    return data;
  }
}
