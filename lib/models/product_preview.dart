class ProductPreview {
  int? id;
  String? imageUrl;

  ProductPreview({this.id, this.imageUrl});

  ProductPreview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['product_images'] != null) {
      imageUrl = json['product_images'].first['image_url'];
    }
  }

  @override
  String toString() {
    return 'Product Preview{id: $id, imageUrl: $imageUrl}';
  }
}
