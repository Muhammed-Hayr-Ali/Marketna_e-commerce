class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  String? imageUrl;
  int? quantity;
  String? category;
  String? quality;
  int? favoriteCount;
  int? viewsCount;
  DateTime? createdAt;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.quantity,
    this.category,
    this.quality,
    this.favoriteCount,
    this.viewsCount,
    this.createdAt,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
    quantity = json['quantity'];
    category = json['category'];
    quality = json['quality'];
    favoriteCount = json['favorite_count'];
    viewsCount = json['views_count'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['image_url'] = imageUrl;
    data['quantity'] = quantity;
    data['category'] = category;
    data['quality'] = quality;
    data['favorite_count'] = favoriteCount;
    data['views_count'] = viewsCount;
    return data;
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, quantity: $quantity, category: $category, quality: $quality, favoriteCount: $favoriteCount, viewsCount: $viewsCount, createdAt: $createdAt}';
  }
}
