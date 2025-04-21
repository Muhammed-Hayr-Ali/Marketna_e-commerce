class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  String? imageUrl;
  int? quantity;
  String? category;
  DateTime? createdAt;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.quantity,
    this.category,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
    quantity = json['quantity'];
    category = json['category'];
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
    return data;
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, quantity: $quantity, category: $category, createdAt: $createdAt}';
  }
}
