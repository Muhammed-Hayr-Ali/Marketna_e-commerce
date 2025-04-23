import 'package:application/utils/import.dart';

class ProductDetailsController extends GetxController {
  /// Variables
  final _supabase = Supabase.instance.client;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;
  Rx<Product> productDetails = Product().obs;

  // Add your controller logic here
  void fetchProductDetails(int productId) async {
    isLoading.value = true;
    error.value = '';
    // Logic to fetch product details
    try {
      final response = await _supabase
          .from(KEYS.PRODUCTS_TABLE)
          .select()
          .eq(KEYS.ID, productId);
      productDetails.value = Product.fromJson(
        jsonDecode(jsonEncode(response[0])),
      );
    } catch (e) {
      debugPrint(e.toString());
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void addToCart(String productId) {
    // Logic to add the product to the cart
  }

  void removeFromCart(String productId) {
    // Logic to remove the product from the cart
  }
}
