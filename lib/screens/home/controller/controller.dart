import 'package:application/constants/import.dart';

class HomeController extends GetxController {
  final supabase = Supabase.instance.client;

  bool isLoading = true;
  List<ProductModel> premiumProducts = [];

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
          .from(TableNames.productDetails)
          .select('${ColumnNames.id}, ${TableNames.productImages}(image_url)')
          .eq(ColumnNames.qualityId, 1)
          .limit(10)
          .order(ColumnNames.createdAt, ascending: false);

      if (response.isEmpty) {
        debugPrint('No products found');
        return;
      }

      premiumProducts = List<ProductModel>.from(
        response.map((product) => ProductModel.fromJson(product)),
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
