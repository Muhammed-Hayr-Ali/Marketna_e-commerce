class ProductModel {
  int? id;
  String? name;
  String? description;
  double? price;
  double? oldPrice;
  String? imageUrl;
  int? quantity;
  String? category;
  String? quality;
  int? favoriteCount;
  int? viewsCount;
  String? createdAt;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.oldPrice,
    this.imageUrl,
    this.quantity,
    this.category,
    this.quality,
    this.favoriteCount,
    this.viewsCount,
    this.createdAt,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price']?.toDouble();
    oldPrice = json['old_price']?.toDouble();
    imageUrl = json['image_url'];
    quantity = json['quantity'];
    category = json['category'];
    quality = json['quality'];
    favoriteCount = json['favorite_count'];
    viewsCount = json['views_count'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['image_url'] = imageUrl;
    data['quantity'] = quantity;
    data['category'] = category;
    data['quality'] = quality;
    data['favorite_count'] = favoriteCount;
    data['views_count'] = viewsCount;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, price: $price, oldPrice $oldPrice, imageUrl: $imageUrl, quantity: $quantity, category: $category, quality: $quality, favoriteCount: $favoriteCount, viewsCount: $viewsCount, createdAt: $createdAt}';
  }
}
