class UserPurchaseModel {
  int? id;
  String? createdAt;
  String? userId;
  int? productId;

  UserPurchaseModel({this.id, this.createdAt, this.userId, this.productId});

  UserPurchaseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['user_id'] = userId;
    data['product_id'] = productId;
    return data;
  }
}
