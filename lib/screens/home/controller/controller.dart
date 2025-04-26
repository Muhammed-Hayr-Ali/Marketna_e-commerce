import 'package:application/utils/import.dart';

class HomeController extends GetxController {
  final supabase = Supabase.instance.client;

  bool isLoading = true;
  List<Product> premiumProducts = [];

  @override
  void onInit() {
    _fetchPremiumProducts();
    super.onInit();
  }

  /// جلب المنتجات من Supabase
  Future<void> _fetchPremiumProducts() async {
    try {
      debugPrint('Fetching products...');
      final response = await supabase
          .from(KEYS.PRODUCTS_TABLE)
          .select('${KEYS.ID}, ${KEYS.IMAGE_URL}')
          .eq(KEYS.COLUMN_QUALITY, KEYS.PREMIUM)
          .limit(10)
          .order(KEYS.CREATED_AT, ascending: false);

      if (response.isEmpty) {
        debugPrint('No products found');
        return;
      }

      premiumProducts = List<Product>.from(
        response.map((product) => Product.fromJson(product)),
      );

      debugPrint('Products fetched successfully');
    } catch (error) {
      debugPrint('Error fetching products: $error');
    } finally {
      isLoading = false;
      debugPrint('Loading completed with ${premiumProducts.length} products');
      update();
    }
  }
}
