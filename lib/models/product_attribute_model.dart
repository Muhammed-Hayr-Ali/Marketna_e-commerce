class ProductAttributeModel {
  int? id;
  int? productId;
  String? key;
  String? value;
  String? createdAt;

  ProductAttributeModel({
    this.id,
    this.productId,
    this.key,
    this.value,
    this.createdAt,
  });

  ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    key = json['key'];
    value = json['value'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['key'] = key;
    data['value'] = value;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  String toString() {
    return 'ProductAttributeModel(id: $id, productId: $productId, key: $key, value: $value, createdAt: $createdAt)';
  }
}
