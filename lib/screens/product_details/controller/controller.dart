import 'package:application/constants/import.dart';
import 'package:application/models/product_detail_model.dart';
import 'package:application/models/product_review_model.dart';

class ProductDetailsController extends GetxController {
  final int productId;
  ProductDetailsController({required this.productId});

  /// Instance
  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();

  ///General Variables
  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  /// Product
  ProductDetailModel? product;

  /// Images
  RxList<String> imagesList = <String>[].obs;

  RxInt currentImageIndex = 0.obs;

  /// Reviews
  List<ProductReviewModel> reviewsList = [];
  final RxInt _reviewCount = 0.obs;
  int get reviewCount => _reviewCount.value;
  final RxDouble _reviewScore = 0.0.obs;
  double get reviewScore => _reviewScore.value;
  final RxBool _hasReview = false.obs;
  bool get hasReview => _hasReview.value;

  /// Favourite
  List<int> favouriteList = [];
  final RxInt _favouriteCount = 0.obs;
  int get favouriteCount => _favouriteCount.value;
  final RxBool _isFavourite = false.obs;
  bool get isFavourite => _isFavourite.value;

  @override
  void onInit() {
    super.onInit();
    _fetchData();
    //  _fetchProductDetails();
  }

  @override
  void onClose() {
    _updateProductViews();
    super.onClose();
  }

  Future<void> _fetchData() async {
    try {
      _isLoading.value = true;

      /// Fetch Product
      final product = await _fetchProductDetails();

      if (product == null) return;

      /// Set Product
      this.product = product;

      // await _collectionProductReviews(product.reviews ?? []);

      await _fetchProductFavourite();
    } on Exception catch (error) {
      _errorMessage.value = 'Something has gone wrong somewhere';
      debugPrint(error.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  Future<ProductDetailModel?> _fetchProductDetails() async {
    try {
      debugPrint('Fetching products...');
      final response = await _supabase
          .from(TableNames.productDetails)
          .select(
            'id, name, description, price, old_price, quantity, favorite_count, views_count, product_attributes(key, value), product_categories(name), product_qualities(name), product_images(image_url), product_reviews(rating_value, comment, user_profiles(*)), user_purchases(user_id)',
          )
          .eq(ColumnNames.id, productId);

      if (response.isEmpty) {
        throw 'Product not found';
      }
      debugPrint('Products fetched successfully');
      return ProductDetailModel.fromJson(response[0]);
    } catch (error) {
      debugPrint('Error fetching products: $error');
    }
    return null;
  }

  // Future<void> _collectionProductReviews(List<ProductReview> reviewsList) async {
  //   final user = _supabase.auth.currentUser;
  //  // if (reviews == null || reviews == []) return;

  //   /// reviews collection
  //   reviewsList = reviews;
  //   _reviewCount.value = reviews.length;
  //   _reviewScore.value =
  //       reviews.map((e) => e.ratingValue ?? 0.0).reduce((a, b) => a + b) /
  //       reviews.length;
  //   _hasReview.value = reviews.any((e) => e.userProfiles?.userId == user?.id);
  // }

  /// Check if a product is in the user's favorites
  ///
  /// Return true if the product is in the user's favorites, false otherwise
  Future<void> _fetchProductFavourite() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    List<int> favouriteList = _storage.read('favorite${user.id}') ?? <int>[];
    this.favouriteList = favouriteList;
    _favouriteCount.value = product?.favoriteCount ?? 0;
    _isFavourite.value = favouriteList.contains(productId);
  }

  /// Toggle favorite
  ///
  /// Add or remove a product from the user's favorites
  Future<void> toggleFavorite(bool isFavorite) async {
    final currentUser = _supabase.auth.currentUser;
    if (currentUser == null) return;

    if (isFavorite) {
      favouriteList.remove(productId);
    } else {
      favouriteList.add(productId);
    }

    _isFavourite.value = !isFavorite;
    _storage.write('favorite${currentUser.id}', favouriteList);
  }

  /// onClose
  Future<void> _updateProductViews() async {
    try {
      if (product == null) return;
      await _supabase
          .from('products')
          .update({'views_count': product!.viewsCount! + 1})
          .eq('id', productId);
    } on Exception catch (error) {
      CustomNotification.showSnackbar(
        message: 'Something has gone wrong somewhere',
      );
      debugPrint(error.toString());
    }
  }
}
