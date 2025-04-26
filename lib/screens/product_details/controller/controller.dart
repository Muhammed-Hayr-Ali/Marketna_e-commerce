import 'package:application/models/rating_model.dart';
import 'package:application/utils/import.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController({required this.productId});

  final int productId;

  /// Variables
  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();
  String uid = '';

  bool isLoading = true;
  Product? product;

  /// Favorites
  bool isProductFavorited = false;
  List<int> favoriteProducts = [];
  int? favoriteCount = 0;

  int? viewsCount = 0;

  int reviewCount = 0;
  double reviewRating = 0.0;

  @override
  void onInit() {
    uid = _supabase.auth.currentUser!.id;
    _checkIfProductFavorited();
    _fitchProductDetails();
    _getReviewRating();

    // debugPrint('Initializing ProductDetails');
    // _initializing();
    // _checkIfProductFavorited(product.id!);

    super.onInit();
  }

  @override
  void onClose() {
    _saveData();
    super.onClose();
  }

  Future<void> _fitchProductDetails() async {
    try {
      final response = await _supabase
          .from(KEYS.PRODUCTS_TABLE)
          .select()
          .eq(KEYS.ID, productId);

      if (response.isEmpty) return;

      product = Product.fromJson(response[0]);
      viewsCount = product!.viewsCount ?? 0;
      favoriteCount = product!.favoriteCount ?? 0;
    } catch (error) {
      debugPrint('Error initializing product details: $error');
    } finally {
      isLoading = false;
      update();
    }
  }

  // Future<void> _initializing() async {
  //   debugPrint('Product details initialized');

  //   try {
  //     final response = await _supabase
  //         .from(KEYS.PRODUCTS_TABLE)
  //         .select('''${KEYS.VIEWS_COUNT}, ${KEYS.FAVORITE_COUNT}''')
  //         .eq(KEYS.ID, product.id!);

  //     if (response.isEmpty) return;

  //     favoriteCount = response[0][KEYS.FAVORITE_COUNT] ?? 0;
  //     viewsCount = response[0][KEYS.VIEWS_COUNT];
  //     update();
  //   } catch (error) {
  //     debugPrint('Error initializing product details: $error');
  //   }
  // }

  // Check if Product favorited
  void _checkIfProductFavorited() {
    final result =
        _storage.read(AppStorageKey.FAVORITE_PRODUCTS_KEY + uid) ?? '[]';
    favoriteProducts = List<int>.from(jsonDecode(result));
    isProductFavorited = favoriteProducts.contains(productId);
    update();
  }

  Future<void> _getReviewRating() async {
    try {
      final response = await _supabase
          .from(KEYS.RATINGS_TABLE)
          .select(KEYS.RATING_VALUE)
          .eq(KEYS.PRODUCT_ID, productId);

      if (response.isEmpty) return;

      /// get review rating
      List<Rating> rating = response.map((e) => Rating.fromJson(e)).toList();
      reviewCount = rating.length;
      reviewRating =
          rating.map((e) => e.ratingValue ?? 0.0).reduce((a, b) => a + b) /
          rating.length;
      update();
    } catch (error) {
      debugPrint('Error getting review rating: $error');
    }
  }

  Future<void> toggleFavorite() async {
    if (isProductFavorited) {
      favoriteProducts.remove(productId);
      favoriteCount == 0
          ? favoriteCount = 0
          : favoriteCount = (favoriteCount ?? 0) - 1;
    } else {
      favoriteProducts.add(productId);
      favoriteCount = (favoriteCount ?? 0) + 1;
    }

    isProductFavorited = !isProductFavorited;
    update();
  }

  Future<void> _saveData() async {
    await _storage.write(
      AppStorageKey.FAVORITE_PRODUCTS_KEY + uid,
      jsonEncode(favoriteProducts),
    );

    await _supabase
        .from(KEYS.PRODUCTS_TABLE)
        .update({
          KEYS.FAVORITE_COUNT: favoriteCount,
          KEYS.VIEWS_COUNT: (viewsCount ?? 0) + 1,
        })
        .eq(KEYS.ID, productId);
  }
}
