import 'package:application/constants/import.dart';

class ProductDetailsController extends GetxController {
  final int? productId;
  ProductDetailsController({this.productId});

  // 🔧 Instance
  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();
  final _mainController = ProductDetailsMainController();

  // General Variables
  bool isLoading = true;
  String? error;

  ProductFullDetailsModel? productDetails;

  /// Images index
  int currentImageIndex = 0;

  /// Favorites
  bool isFavorite = false;
  List<int> favorites = [];
  int favoriteCount = 0;

  /// Reviews
  List<ProductReviews> reviews = [];
  int reviewCount = 0;
  double reviewRating = 0.0;
  bool hasReview = false;

  /// user purchases
  List<UserPurchases> userPurchases = [];
  int userPurchasesCount = 0;
  bool isPurchased = false;

  /// Views
  int viewsCount = 0;

  @override
  onInit() {
    super.onInit();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      /// Fetch product details
      final productDetails = await _fetchProductDetails(productId: productId!);
      if (productDetails == null) return;
      this.productDetails = productDetails;

      /// Fetch favorites
      final isFavorite = await _fetchFavorites();
      this.isFavorite = isFavorite;

      /// Fetch reviews
      await _populateReviews(productDetails.productReviews);

      /// Fetch user purchases
      final isPurchased = _hasCurrentUserPurchased(
        productDetails.userPurchases,
      );
      this.isPurchased = isPurchased;

      /// Fetch Purchases
      _fetchViews(productDetails.userPurchases);

      /// Fetch views
      viewsCount = productDetails.viewsCount ?? 0;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  /// Fetch product details
  Future<ProductFullDetailsModel?> _fetchProductDetails({
    required int productId,
  }) async {
    try {
      final response =
          await _supabase
              .from(TableNames.productDetails)
              .select('''
            *,
            product_attributes(key, value),
            product_categories(name),
            product_images(image_url),
            product_qualities(name),
            user_purchases(user_id),
            product_reviews(
              rating_value,
              comment,
              user_profiles(
                display_name,
                name,
                full_name,
                user_name,
                preferred_username,
                avatar,
                avatar_url,
                picture
              )
            )
            ''')
              .eq(ColumnNames.id, productId)
              .single();

      return ProductFullDetailsModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  /// Fetch favorites
  Future<bool> _fetchFavorites() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return false;

    final favoritesKey = StorageKeys.favourites + userId;
    final storedFavorites = await _storage.read(favoritesKey);
    if (storedFavorites == null) return false;

    final favoriteIds = List<int>.from(
      jsonDecode(storedFavorites) as List<dynamic>,
    );
    favoriteCount = favoriteIds.length;
    return favoriteIds.contains(productId!);
  }

  /// Populate reviews data
  Future<void> _populateReviews(List<ProductReviews>? reviews) async {
    if (reviews == null) return;

    this.reviews = reviews;

    reviewCount = reviews.length;
    final totalRatings = reviews.fold<double>(
      0,
      (sum, review) => sum + (review.ratingValue ?? 0.0),
    );
    reviewRating = reviewCount > 0 ? totalRatings / reviewCount : 0.0;
    hasReview = reviewCount > 0;
  }

  bool _hasCurrentUserPurchased(List<UserPurchases>? userPurchases) {
    final currentUserId = _supabase.auth.currentUser?.id;

    if (currentUserId == null || userPurchases == null) {
      return false;
    }

    return userPurchases.any((purchase) => purchase.userId == currentUserId);
  }

  void _fetchViews(List<UserPurchases>? userPurchases) {
    final currentUserId = _supabase.auth.currentUser?.id;
    if (currentUserId == null || userPurchases == null) {
      return;
    }
    this.userPurchases = userPurchases;
    userPurchasesCount = userPurchases.length;
    isPurchased = userPurchases.any(
      (purchase) => purchase.userId == currentUserId,
    );
    update();
  }

  /// update fanctions
  /// Update current image
  void updateCurrentImage(int index) {
    currentImageIndex = index;
    update();
  }

  /// Update favorites
  Future<void> toggleFavoriteProduct() async {
    try {
      final currentUserId = _supabase.auth.currentUser?.id;
      if (currentUserId == null) return;

      final favoriteIdsKey = StorageKeys.favourites + currentUserId;
      final storedFavoriteIds = await _storage.read(favoriteIdsKey);
      final favoriteIds = List<int>.from(
        storedFavoriteIds == null
            ? <String>[]
            : jsonDecode(storedFavoriteIds) as List<dynamic>,
      );

      if (isFavorite) {
        favoriteIds.remove(productId!);
      } else {
        favoriteIds.add(productId!);
      }

      favoriteCount = favoriteIds.length;

      await _storage.write(favoriteIdsKey, jsonEncode(favoriteIds));

      isFavorite = !isFavorite;
      update();
    } catch (error) {
      rethrow;
    }
  }

  /// update reviews
  Future<void> updateReviews() async {
    if (hasReview) {
      final result = await _mainController.writeReview(productId: productId!);
      if (result != null) {
        reviews.add(result);
        reviewCount = reviews.length;
        final totalRatings = reviews.fold<double>(
          0,
          (sum, review) => sum + (review.ratingValue ?? 0.0),
        );
        reviewRating = reviewCount > 0 ? totalRatings / reviewCount : 0.0;
        hasReview = reviewCount > 0;
        update();
      }
    }
  }
}
