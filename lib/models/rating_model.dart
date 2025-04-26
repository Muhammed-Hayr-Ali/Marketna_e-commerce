class Rating {
  String? id;
  int? productId;
  String? userId;
  double? ratingValue;
  DateTime? createdAt;

  // Constructor
  Rating({
    this.id,
    this.productId,
    this.userId,
    this.ratingValue,
    this.createdAt,
  });

  // Factory method to create a Rating from JSON
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      productId: json['product_id'],
      userId: json['user_id'],
      ratingValue: json['rating_value'].toDouble(),
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
    );
  }

  // Method to convert Rating to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'user_id': userId,
      'rating_value': ratingValue,
    };
  }

  @override
  String toString() {
    return 'Rating{id: $id, productId: $productId, userId: $userId, ratingValue: $ratingValue, createdAt: $createdAt}';
  }
}
