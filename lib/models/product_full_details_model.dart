class ProductFullDetailsModel {
  String? name;
  String? description;
  int? id;
  double? price;
  double? oldPrice;
  int? quantity;
  int? favoriteCount;
  int? viewsCount;
  int? categoryId;
  int? qualityId;
  String? createdAt;
  List<ProductAttributes>? productAttributes;
  ProductCategories? productCategories;
  ProductCategories? productQualities;
  List<ProductImages>? productImages;
  List<ProductReviews>? productReviews;
  List<UserPurchases>? userPurchases;

  ProductFullDetailsModel({
    this.name,
    this.description,
    this.id,
    this.price,
    this.oldPrice,
    this.quantity,
    this.favoriteCount,
    this.viewsCount,
    this.categoryId,
    this.qualityId,
    this.createdAt,
    this.productAttributes,
    this.productCategories,
    this.productQualities,
    this.productImages,
    this.productReviews,
    this.userPurchases,
  });

  ProductFullDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    quantity = json['quantity'];
    favoriteCount = json['favorite_count'];
    viewsCount = json['views_count'];
    categoryId = json['category_id'];
    qualityId = json['quality_id'];
    createdAt = json['created_at'];
    if (json['product_attributes'] != null) {
      productAttributes = <ProductAttributes>[];
      json['product_attributes'].forEach((v) {
        productAttributes!.add(ProductAttributes.fromJson(v));
      });
    }
    productCategories =
        json['product_categories'] != null
            ? ProductCategories.fromJson(json['product_categories'])
            : null;
    productQualities =
        json['product_qualities'] != null
            ? ProductCategories.fromJson(json['product_qualities'])
            : null;
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
    if (json['product_reviews'] != null) {
      productReviews = <ProductReviews>[];
      json['product_reviews'].forEach((v) {
        productReviews!.add(ProductReviews.fromJson(v));
      });
    }
    if (json['user_purchases'] != null) {
      userPurchases = <UserPurchases>[];
      json['user_purchases'].forEach((v) {
        userPurchases!.add(UserPurchases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['quantity'] = quantity;
    data['favorite_count'] = favoriteCount;
    data['views_count'] = viewsCount;
    data['category_id'] = categoryId;
    data['quality_id'] = qualityId;
    data['created_at'] = createdAt;
    if (productAttributes != null) {
      data['product_attributes'] =
          productAttributes!.map((v) => v.toJson()).toList();
    }
    if (productCategories != null) {
      data['product_categories'] = productCategories!.toJson();
    }
    if (productQualities != null) {
      data['product_qualities'] = productQualities!.toJson();
    }
    if (productImages != null) {
      data['product_images'] = productImages!.map((v) => v.toJson()).toList();
    }
    if (productReviews != null) {
      data['product_reviews'] = productReviews!.map((v) => v.toJson()).toList();
    }
    if (userPurchases != null) {
      data['user_purchases'] = userPurchases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttributes {
  String? key;
  String? value;

  ProductAttributes({this.key, this.value});

  ProductAttributes.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class ProductCategories {
  String? name;

  ProductCategories({this.name});

  ProductCategories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class ProductImages {
  String? imageUrl;

  ProductImages({this.imageUrl});

  ProductImages.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    return data;
  }
}

class ProductReviews {
  String? comment;
  double? ratingValue;
  UserProfiles? userProfiles;

  ProductReviews({this.comment, this.ratingValue, this.userProfiles});

  ProductReviews.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    ratingValue = json['rating_value'].toDouble();
    userProfiles =
        json['user_profiles'] != null
            ? UserProfiles.fromJson(json['user_profiles'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['rating_value'] = ratingValue;
    if (userProfiles != null) {
      data['user_profiles'] = userProfiles!.toJson();
    }
    return data;
  }
}

class UserProfiles {
  int? id;
  String? name;
  String? role;
  String? email;
  String? avatar;
  Null picture;
  String? userId;
  Null fullName;
  Null userName;
  Null avatarUrl;
  String? createdAt;
  Null displayName;
  Null preferredUsername;

  UserProfiles({
    this.id,
    this.name,
    this.role,
    this.email,
    this.avatar,
    this.picture,
    this.userId,
    this.fullName,
    this.userName,
    this.avatarUrl,
    this.createdAt,
    this.displayName,
    this.preferredUsername,
  });

  UserProfiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    avatar = json['avatar'];
    picture = json['picture'];
    userId = json['user_id'];
    fullName = json['full_name'];
    userName = json['user_name'];
    avatarUrl = json['avatar_url'];
    createdAt = json['created_at'];
    displayName = json['display_name'];
    preferredUsername = json['preferred_username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['email'] = email;
    data['avatar'] = avatar;
    data['picture'] = picture;
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['user_name'] = userName;
    data['avatar_url'] = avatarUrl;
    data['created_at'] = createdAt;
    data['display_name'] = displayName;
    data['preferred_username'] = preferredUsername;
    return data;
  }
}

class UserPurchases {
  String? userId;

  UserPurchases({this.userId});

  UserPurchases.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    return data;
  }
}
