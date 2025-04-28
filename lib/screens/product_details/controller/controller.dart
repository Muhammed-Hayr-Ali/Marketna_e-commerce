import 'package:application/utils/import.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController({required this.imageUrl, required this.productId});

  final int productId;
  final String imageUrl;

  /// Images
  final pageController = PageController();
  List<String> images = [];
  RxInt imagesCount = 0.obs;
  RxInt currentImageIndex = 0.obs;

  /// Variables
  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();
  String uid = '';
  User? user;

  bool isLoading = true;
  bool isLoadingFRV = true;
  RxBool sendCommentISLoading = false.obs;
  Product? product;

  /// Favorites
  List<int> favoriteProducts = [];
  bool isProductFavorited = false;
  int? favoriteCount = 0;

  /// Views
  int? viewsCount = 0;

  /// Reviews
  bool reviewsLoading = true;
  List<Review> reviews = [];
  bool isReviewSubmitted = false;
  int reviewCount = 0;
  double reviewRating = 0.0;

  bool haveThieProducr = false;

  RxDouble ratingValue = 0.0.obs;

  @override
  void onInit() {
    user = _supabase.auth.currentUser!;
    uid = user!.id;
    images.insert(0, imageUrl);
    _fitchProductImages();
    _checkIfProductFavorited();
    _fitchProductDetails();

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

  void _fitchProductImages() async {
    try {
      final response = await _supabase
          .from(KEYS.PRODUCT_IMAGES_TABLE)
          .select(KEYS.IMAGE_URL)
          .eq(KEYS.PRODUCT_ID, productId);

      if (response.isEmpty) return;

      List<String> imagesList =
          response.map((e) => e['image_url'] as String).toList();

      images.addAll(imagesList);
      imagesCount.value = images.length;
    } catch (error) {
      debugPrint('Error initializing product images: $error');
    } finally {
      update();
    }
  }

  void _checkIfProductFavorited() {
    try {
      final result =
          _storage.read(AppStorageKey.FAVORITE_PRODUCTS_KEY + uid) ?? '[]';
      favoriteProducts = List<int>.from(jsonDecode(result));
      isProductFavorited = favoriteProducts.contains(productId);
    } catch (error) {
      debugPrint('error : ${error.toString()}');
      throw 'An error occurred while favorites';
    } finally {
      update();
    }
  }

  Future<void> _fitchProductDetails() async {
    try {
      final response = await _supabase
          .from(KEYS.PRODUCTS_TABLE)
          .select()
          .eq(KEYS.ID, productId);

      if (response.isEmpty) return;

      product = Product.fromJson(response[0]);
      _fitchProductFRV();
    } catch (error) {
      debugPrint('Error initializing product details: $error');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> _fitchProductFRV() async {
    try {
      await _getReviews();
      haveThieProducr = await _getPurchases();
      favoriteCount = product!.favoriteCount;
      viewsCount = product!.viewsCount;
    } catch (error) {
      debugPrint('error : ${error.toString()}');
    } finally {
      isLoadingFRV = false;
      update();
    }
  }

  Future<void> _getReviews() async {
    try {
      final response = await _supabase
          .from(KEYS.REVIEWS_TABLE)
          .select('*, profiles: user_id (*)')
          .eq(KEYS.PRODUCT_ID, productId);

      if (response.isEmpty) return;

      /// get all reviews
      reviews = response.map((e) => Review.fromJson(e)).toList();

      /// check if user has submitted review
      isReviewSubmitted = reviews.any((e) => e.userId == uid);

      /// calculate review count
      reviewCount = response.length;

      /// calculate review rating
      reviewRating =
          reviews.map((e) => e.ratingValue ?? 0.0).reduce((a, b) => a + b) /
          reviews.length;
    } catch (error) {
      debugPrint('error : ${error.toString()}');
      throw 'An error occurred while reviews';
    }
  }

  Future<bool> _getPurchases() async {
    try {
      final response = await _supabase
          .from(KEYS.PURCHASES_TABLE)
          .select()
          .eq(KEYS.PRODUCT_ID, productId)
          .eq(KEYS.USER_ID, uid);
      if (response.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint('error : ${error.toString()}');
      throw 'An error occurred while Purchases';
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

  Future<bool> sendReview(Review review) async {
    sendCommentISLoading.value = true;
    try {
      await _supabase.from(KEYS.REVIEWS_TABLE).insert(review.toJson());
      await _fitchProductFRV();
      ratingValue.value = 0.0;
      return true;
    } catch (error) {
      debugPrint('error : ${error.toString()}');
      CustomNotification.showSnackbar(message: 'send Comment Error');
      return false;
    } finally {
      sendCommentISLoading.value = false;
    }
  }

  Future<void> _saveData() async {
    try {
      await _storage.write(
        AppStorageKey.FAVORITE_PRODUCTS_KEY + uid,
        jsonEncode(favoriteProducts),
      );
      if (product == null) return;
      await _supabase
          .from(KEYS.PRODUCTS_TABLE)
          .update({
            KEYS.FAVORITE_COUNT: favoriteCount,
            KEYS.VIEWS_COUNT: (viewsCount ?? 0) + 1,
          })
          .eq(KEYS.ID, productId);
    } catch (error) {
      debugPrint('error : ${error.toString()}');
    }
  }
}
