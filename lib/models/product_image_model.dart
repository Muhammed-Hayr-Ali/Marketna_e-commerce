class ProductImageModel {
  int? id;
  int? productId;
  String? imageUrl;
  String? createdAt;

  ProductImageModel({this.id, this.productId, this.imageUrl, this.createdAt});

  ProductImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  String toString() {
    return 'ProductImageModel(id: $id, productId: $productId, imageUrl: $imageUrl, createdAt: $createdAt)';
  }
}
