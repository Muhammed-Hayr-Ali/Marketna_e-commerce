import 'package:application/constants/import.dart';

class FavoriteController extends GetxService {
  final _supabase = Supabase.instance.client;
  RxBool isLoading = false.obs;

  Future<void> fetchProducts() async {
    try {
      debugPrint('Fetching products...');
      final response = await _supabase
          .from(TableNames.productDetails)
          .select(
            'id, name, description, price, old_price, quantity, favorite_count, views_count, product_attributes(key, value), product_categories(name), product_qualities(name), product_images(image_url), product_reviews(rating_value, comment, user_profiles(*)), user_purchases(user_id)',
          );

      if (response.isEmpty) {
        debugPrint('No products found');
        return;
      }
      ProductDetails product = ProductDetails.fromJson(response[0]);

      debugPrint('Products fetched successfully');
      debugPrint(product.name);
      debugPrint(product.favoriteCount.toString());
    } catch (error) {
      debugPrint('Error fetching products: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
