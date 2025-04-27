class Review {
  int? id;
  String? userId;
  int? productId;
  double? ratingValue;
  String? comment;
  Profiles? profiles;
  String? createdAt;

  Review({
    this.id,
    this.userId,
    this.productId,
    this.ratingValue,
    this.comment,
    this.profiles,
    this.createdAt,
  });

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    ratingValue = json['rating_value'].toDouble();
    comment = json['comment'];
    profiles =
        json['profiles'] != null ? Profiles.fromJson(json['profiles']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['rating_value'] = ratingValue;
    data['comment'] = comment;
    if (profiles != null) {
      data['profiles'] = profiles!.toJson();
    }
    data['created_at'] = createdAt;
    return data;
  }

  @override
  String toString() {
    return 'Review{id: $id, userId: $userId, productId: $productId, ratingValue: $ratingValue,  comment: $comment, profiles: $profiles, createdAt: $createdAt,}';
  }
}

class Profiles {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? picture;
  String? fullName;
  String? userName;
  String? avatarUrl;
  String? displayName;
  String? preferredUsername;
  String? createdAt;

  Profiles({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.picture,
    this.fullName,
    this.userName,
    this.avatarUrl,
    this.displayName,
    this.preferredUsername,
    this.createdAt,
  });

  Profiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    picture = json['picture'];
    fullName = json['full_name'];
    userName = json['user_name'];
    avatarUrl = json['avatar_url'];
    displayName = json['display_name'];
    preferredUsername = json['preferred_username'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['picture'] = picture;
    data['full_name'] = fullName;
    data['user_name'] = userName;
    data['avatar_url'] = avatarUrl;
    data['display_name'] = displayName;
    data['preferred_username'] = preferredUsername;
    data['created_at'] = createdAt;

    return data;
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, email: $email, avatar: $avatar, picture: $picture, fullName: $fullName, userName: $userName, avatarUrl: $avatarUrl, displayName: $displayName, preferredUsername: $preferredUsername, createdAt: $createdAt,}';
  }
}
