class UserProfileModel {
  int? id;
  String? userId;
  String? email;
  String? role;
  String? name;
  String? fullName;
  String? userName;
  String? displayName;
  String? preferredUsername;
  String? avatar;
  String? avatarUrl;
  String? picture;
  String? createdAt;

  UserProfileModel({
    this.id,
    this.userId,
    this.email,
    this.role,
    this.name,
    this.fullName,
    this.userName,
    this.displayName,
    this.preferredUsername,
    this.avatar,
    this.avatarUrl,
    this.picture,
    this.createdAt,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    email = json['email'];
    role = json['role'];
    name = json['name'];
    fullName = json['full_name'];
    userName = json['user_name'];
    displayName = json['display_name'];
    preferredUsername = json['preferred_username'];
    avatar = json['avatar'];
    avatarUrl = json['avatar_url'];
    picture = json['picture'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['email'] = email;
    data['role'] = role;
    data['name'] = name;
    data['full_name'] = fullName;
    data['user_name'] = userName;
    data['display_name'] = displayName;
    data['preferred_username'] = preferredUsername;
    data['avatar'] = avatar;
    data['avatar_url'] = avatarUrl;
    data['picture'] = picture;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  @override
  String toString() {
    return 'UserProfileModel(id: $id, userId: $userId, email: $email, role: $role name: $name, fullName: $fullName, userName: $userName, displayName: $displayName, preferredUsername: $preferredUsername, avatar: $avatar, avatarUrl: $avatarUrl, picture: $picture, createdAt: $createdAt)';
  }
}
