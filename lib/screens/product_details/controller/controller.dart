import 'package:application/models/review_model.dart';
import 'package:application/utils/import.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController({required this.productId});

  final int productId;

  /// Variables
  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();
  String uid = '';

  bool isLoading = true;
  bool reviewsLoading = true;
  Product? product;

  /// Favorites
  List<int> favoriteProducts = [];
  bool isProductFavorited = false;
  int? favoriteCount = 0;

  /// Views
  int? viewsCount = 0;

  /// Reviews
  List<Review> reviews = [];
  bool isReviewSubmitted = false;
  int reviewCount = 0;
  double reviewRating = 0.0;

  @override
  void onInit() {
    uid = _supabase.auth.currentUser!.id;
    _checkIfProductFavorited();
    _fitchProductDetails();
    _getReviews();

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

  // Check if Product favorited
  void _checkIfProductFavorited() {
    final result =
        _storage.read(AppStorageKey.FAVORITE_PRODUCTS_KEY + uid) ?? '[]';
    favoriteProducts = List<int>.from(jsonDecode(result));
    isProductFavorited = favoriteProducts.contains(productId);
    update();
  }

  Future<void> _getReviews() async {
    try {
      final response = await _supabase
          .from(KEYS.REVIEWS_TABLE)
          .select('*, profiles: user_id (*)')
          .eq(KEYS.ID, productId);
      if (response.isEmpty) return;

      /// get all reviews
      reviews = response.map((e) => Review.fromJson(e)).toList();

      /// check if user has submitted review
      isReviewSubmitted = reviews.any((e) => e.userId == uid);

      /// calculate review count
      reviewCount = reviews.length;

      /// calculate review rating
      reviewRating =
          reviews.map((e) => e.ratingValue ?? 0.0).reduce((a, b) => a + b) /
          reviews.length;
    } catch (error) {
      debugPrint('Error getting review rating: $error');
    } finally {
      reviewsLoading = false;
      update();
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
