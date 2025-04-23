import 'package:application/utils/import.dart';

class HomeController extends GetxController {
  final supabase = Supabase.instance.client;

  // المتغيرات الأساسية
  RxBool isLoading = false.obs;
  final RxList<Product> products = RxList<Product>([]);
  // List<Product> get products => _products;

  @override
  void onInit() {
    super.onInit();
    debugPrint('HomeController initialized');
    initializeData();
  }

  /// تهيئة البيانات عند بدء الكونترولر
  Future<void> initializeData() async {
    await fetchProducts().catchError((error) {
      handleError(error);
    });
  }

  /// جلب المنتجات من Supabase
  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      debugPrint('Fetching products...');
      final response = await supabase
          .from(KEYS.PRODUCTS_TABLE)
          .select()
          .eq(KEYS.COLUMN_QUALITY, KEYS.PREMIUM);

      if (response.isEmpty) {
        debugPrint('No products found');
        return;
      }

      debugPrint('Products fetched successfully');
      products.clear();
      products.addAll(response.map((product) => Product.fromJson(product)));
    } finally {
      isLoading.value = false;
    }
  }

  /// إدارة الأخطاء وإظهار رسائل للمستخدم
  void handleError(dynamic error) {
    debugPrint('Error fetching products: $error');
  }
}
