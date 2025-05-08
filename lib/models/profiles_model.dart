class ProfilesModel {
  String? email;
  String? name;
  String? fullName;
  String? userName;
  String? preferredUsername;
  String? picture;
  String? avatarUrl;
  String? avatar;
  String? displayName;
  String? createdAt;
  String? userId;
  int? id;

  ProfilesModel({
    this.email,
    this.name,
    this.fullName,
    this.userName,
    this.preferredUsername,
    this.picture,
    this.avatarUrl,
    this.avatar,
    this.displayName,
    this.createdAt,
    this.userId,
    this.id,
  });

  ProfilesModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    fullName = json['full_name'];
    userName = json['user_name'];
    preferredUsername = json['preferred_username'];
    picture = json['picture'];
    avatarUrl = json['avatar_url'];
    avatar = json['avatar'];
    displayName = json['display_name'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['full_name'] = fullName;
    data['user_name'] = userName;
    data['preferred_username'] = preferredUsername;
    data['picture'] = picture;
    data['avatar_url'] = avatarUrl;
    data['avatar'] = avatar;
    data['display_name'] = displayName;
    data['created_at'] = createdAt;
    data['user_id'] = userId;
    data['id'] = id;
    return data;
  }

  /// to String
  @override
  @override
  String toString() {
    return 'ProfilesModel{'
        'email: $email, '
        'name: $name, '
        'fullName: $fullName, '
        'userName: $userName, '
        'preferredUsername: $preferredUsername, '
        'picture: $picture, '
        'avatarUrl: $avatarUrl, '
        'avatar: $avatar, '
        'displayName: $displayName, '
        'createdAt: $createdAt, '
        'userId: $userId, '
        'id: $id'
        '}';
  }
}
