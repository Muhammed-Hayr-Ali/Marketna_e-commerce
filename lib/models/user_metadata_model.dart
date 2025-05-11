class UserMetadata {
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? gender;
  String? picture;
  String? fullName;
  String? userName;
  String? avatarUrl;
  String? dateBirth;
  String? providerId;
  String? countryCode;
  String? displayName;
  bool? emailVerified;
  bool? phoneVerified;
  String? statusMessage;
  String? preferredUsername;

  UserMetadata({
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.gender,
    this.picture,
    this.fullName,
    this.userName,
    this.avatarUrl,
    this.dateBirth,
    this.providerId,
    this.countryCode,
    this.displayName,
    this.emailVerified,
    this.phoneVerified,
    this.statusMessage,
    this.preferredUsername,
  });

  UserMetadata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    gender = json['gender'];
    picture = json['picture'];
    fullName = json['full_name'];
    userName = json['user_name'];
    avatarUrl = json['avatar_url'];
    dateBirth = json['date_birth'];
    providerId = json['provider_id'];
    countryCode = json['country_code'];
    displayName = json['display_name'];
    emailVerified = json['email_verified'];
    phoneVerified = json['phone_verified'];
    statusMessage = json['status_message'];
    preferredUsername = json['preferred_username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['picture'] = picture;
    data['full_name'] = fullName;
    data['user_name'] = userName;
    data['avatar_url'] = avatarUrl;
    data['date_birth'] = dateBirth;
    data['provider_id'] = providerId;
    data['country_code'] = countryCode;
    data['email_verified'] = emailVerified;
    data['phone_verified'] = phoneVerified;
    data['status_message'] = statusMessage;
    data['preferred_username'] = preferredUsername;
 

    return data;
  }

  /// to String
  @override
  @override
  String toString() {
    return 'UserMetadataModel('
        'name: $name, '
        'email: $email, '
        'phone: $phone, '
        'avatar: $avatar, '
        'gender: $gender, '
        'picture: $picture, '
        'fullName: $fullName, '
        'userName: $userName, '
        'avatarUrl: $avatarUrl, '
        'dateBirth: $dateBirth, '
        'providerId: $providerId, '
        'countryCode: $countryCode, '
        'displayName: $displayName, '
        'emailVerified: $emailVerified, '
        'phoneVerified: $phoneVerified, '
        'statusMessage: $statusMessage, '
        'preferredUsername: $preferredUsername)';
  }
}
