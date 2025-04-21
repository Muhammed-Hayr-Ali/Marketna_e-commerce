class Rating {
  final String id;
  final int productId;
  final String userId;
  final double ratingValue;
  final String? review;
  DateTime? createdAt;

  // Constructor
  Rating({
    required this.id,
    required this.productId,
    required this.userId,
    required this.ratingValue,
    this.review,
    this.createdAt,
  });

  // Factory method to create a Rating from JSON
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      productId: json['product_id'],
      userId: json['user_id'],
      ratingValue: json['rating_value'].toDouble(),
      review: json['review'],
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
      'review': review, // Optional field
    };
  }

  @override
  String toString() {
    return 'Rating{id: $id, productId: $productId, userId: $userId, ratingValue: $ratingValue, review: $review, createdAt: $createdAt}';
  }
}
