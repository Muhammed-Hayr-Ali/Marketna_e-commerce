class ImageModel {
  int? id;
  String? createdAt;
  int? productId;
  String? imageUrl;

  ImageModel({this.id, this.createdAt, this.productId, this.imageUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    productId = json['product_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['product_id'] = productId;
    data['image_url'] = imageUrl;
    return data;
  }

  @override
  String toString() {
    return 'ImageModel{id: $id, createdAt: $createdAt, productId: $productId, imageUrl: $imageUrl}';
  }
}
