import 'package:decimal/decimal.dart';

class ProductDetailModel {
  int? id;
  String? name;
  String? description;
  Decimal? price;
  Decimal? oldPrice;
  int? quantity;
  int? favoriteCount;
  int? viewsCount;
  int? categoryId;
  int? qualityId;
  String? createdAt;

  ProductDetailModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.oldPrice,
    this.quantity,
    this.favoriteCount,
    this.viewsCount,
    this.categoryId,
    this.qualityId,
    this.createdAt,
  });

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = _parseToDecimal(json['price']);
    oldPrice = _parseToDecimal(json['old_price']);
    quantity = json['quantity'];
    favoriteCount = json['favorite_count'];
    viewsCount = json['views_count'];
    categoryId = json['category_id'];
    qualityId = json['quality_id'];
    createdAt = json['created_at'];
  }

  static Decimal? _parseToDecimal(dynamic value) {
    if (value == null) return null;
    try {
      final String stringValue = value.toString();
      return Decimal.parse(stringValue);
    } catch (e) {
      return null; // أو يمكنك طرد خطأ حسب الحاجة
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['quantity'] = quantity;
    data['favorite_count'] = favoriteCount;
    data['views_count'] = viewsCount;
    data['category_id'] = categoryId;
    data['quality_id'] = qualityId;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  String toString() {
    return 'ProductDetailModel(id: $id,name: $name, description: $description,  price: $price, oldPrice: $oldPrice, quantity: $quantity, favoriteCount: $favoriteCount, viewsCount: $viewsCount, categoryId: $categoryId, qualityId: $qualityId, createdAt: $createdAt)';
  }
}
