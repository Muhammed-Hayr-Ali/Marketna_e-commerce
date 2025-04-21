class Rating {
  final String id;
  final String userId;
  final double ratingValue;
  final String? review;

  // Constructor
  Rating({
    required this.id,
    required this.userId,
    required this.ratingValue,
    this.review,
  });

  // Factory method to create a Rating from JSON
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      userId: json['userId'],
      ratingValue: json['ratingValue'].toDouble(),
      review: json['review'], // Optional field
    );
  }

  // Method to convert Rating to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'ratingValue': ratingValue,
      'review': review, // Optional field
    };
  }

  @override
  String toString() {
    return 'Rating{id: $id, userId: $userId, ratingValue: $ratingValue, review: $review}';
  }
}
