import 'package:application/models/profiles_model.dart';

class ReviewModel {
  int? id;
  String? createdAt;
  String? userId;
  String? email;
  int? productId;
  int? ratingValue;
  String? comment;
  ProfilesModel? profiles;

  ReviewModel({
    this.id,
    this.createdAt,
    this.userId,
    this.email,
    this.productId,
    this.ratingValue,
    this.comment,
    this.profiles,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    email = json['email'];
    productId = json['product_id'];
    ratingValue = json['rating_value'];
    comment = json['comment'];
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
    data['email'] = email;
    data['product_id'] = productId;
    data['rating_value'] = ratingValue;
    data['comment'] = comment;
    if (profiles != null) {
      data['profiles'] = profiles!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ReviewModel(id: $id, createdAt: $createdAt, userId: $userId, email: $email, productId: $productId, ratingValue: $ratingValue, comment: $comment, profiles: $profiles)';
  }
}
