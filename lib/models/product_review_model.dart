class ProductReviewModel {
  int? id;
  String? userId;
  int? productId;
  double? ratingValue;
  String? comment;
  String? createdAt;

  ProductReviewModel({
    this.id,
    this.userId,
    this.productId,
    this.ratingValue,
    this.comment,
    this.createdAt,
  });

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    ratingValue = json['rating_value'];
    comment = json['comment'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['rating_value'] = ratingValue;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  String toString() {
    return 'ProductReviewModel(id: $id, userId: $userId, productId: $productId, ratingValue: $ratingValue, comment: $comment, createdAt: $createdAt)';
  }
}
