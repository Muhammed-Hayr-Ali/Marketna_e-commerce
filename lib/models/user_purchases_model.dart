import 'package:application/models/profiles_model.dart';

class UserPurchases {
  int? id;
  String? createdAt;
  String? userId;
  int? productId;
  ProfilesModel? profiles;

  UserPurchases({
    this.id,
    this.createdAt,
    this.userId,
    this.productId,
    this.profiles,
  });

  UserPurchases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    productId = json['product_id'];
    profiles =
        json['profiles'] != null
            ? ProfilesModel.fromJson(json['profiles'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['user_id'] = userId;
    data['product_id'] = productId;
    if (profiles != null) {
      data['profiles'] = profiles!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'UserPurchases(id: $id, createdAt: $createdAt, userId: $userId, productId: $productId, profiles: $profiles)';
  }
}
