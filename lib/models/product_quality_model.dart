class ProductQualityModel {
  int? id;
  String? name;
  String? iconUrl;
  String? description;
  String? createdAt;

  ProductQualityModel({
    this.id,
    this.name,
    this.iconUrl,
    this.description,
    this.createdAt,
  });

  ProductQualityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconUrl = json['icon_url'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon_url'] = iconUrl;
    data['description'] = description;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  String toString() {
    return 'ProductQualityModel(id: $id, name: $name, iconUrl: $iconUrl, description: $description, createdAt: $createdAt)';
  }
}
