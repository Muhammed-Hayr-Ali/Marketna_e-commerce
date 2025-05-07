import 'package:application/utils/import.dart';

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
  ProductModel? product;

  /// Images
  RxList<String> imagesList = <String>[].obs;

  RxInt currentImageIndex = 0.obs;

  /// Reviews
  List<ReviewModel> reviewsList = [];
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
      if (product == null) {
        CustomNotification.showSnackbar(message: 'Product not found');
        return;
      }

      /// Set Product
      this.product = product;

      /// Set Images
      if (product.imageUrl != null) {
        imagesList.insert(0, product.imageUrl!);
      }

      /// Futuer await
      Future.wait([
        /// Fetch Images
        _fetchProductImages(),

        /// Fetch Reviews
        // _fetchProductReviews(),

        // /// Fetch Favourites
        // _fetchProductFavourite(),
      ]);
    } on Exception catch (error) {
      _errorMessage.value = 'Something has gone wrong somewhere';
      debugPrint(error.toString());
    } finally {
      _isLoading.value = false;
      update();
    }
  }

  Future<ProductModel?> _fetchProductDetails() async {
    final response =
        await _supabase
            .from('products')
            .select('*')
            .eq('id', productId)
            .maybeSingle();
    if (response == null) return null;
    return ProductModel.fromJson(response);
  }

  Future<void> _fetchProductImages() async {
    List<Map<String, dynamic>> response = await _supabase
        .from('products_images')
        .select('image_url')
        .eq('id', productId);
    debugPrint('response : $response');

    if (response == []) return;
    List<String> imagesList =
        response.map((e) => e['image_url'] as String).toList();
    debugPrint('imagesList : $imagesList');
    this.imagesList.addAll(imagesList);
    debugPrint('this.imagesList : ${this.imagesList}');
  }

  Future<void> _fetchProductReviews() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    List<Map<String, dynamic>> response = await _supabase
        .from('products_reviews')
        .select('*')
        .eq('id', productId);
    if (response == []) return;
    List<ReviewModel> reviewsList =
        response.map((e) => ReviewModel.fromJson(e)).toList();

    /// reviews collection
    this.reviewsList = reviewsList;
    _reviewCount.value = response.length;
    _reviewScore.value =
        reviewsList.map((e) => e.ratingValue ?? 0.0).reduce((a, b) => a + b) /
        reviewsList.length;
    _hasReview.value = reviewsList.any((e) => e.userId == user.id);
  }

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

// class ProductDetailsController extends GetxController {
//   ProductDetailsController({required this.imageUrl, required this.productId});

//   final int productId;
//   final String imageUrl;

//   /// Images
//   final pageController = PageController();
//   List<String> images = [];
//   RxInt imagesCount = 0.obs;
//   RxInt currentImageIndex = 0.obs;

//   /// Variables
//   final _supabase = Supabase.instance.client;
//   final _storage = GetStorage();
//   String uid = '';
//   User? user;

//   bool isLoading = true;
//   bool isLoadingFRV = true;
//   ProductModel? product;

//   /// Favorites
//   List<int> favoriteProducts = [];
//   bool isProductFavorited = false;
//   int? favoriteCount = 0;

//   /// Views
//   int? viewsCount = 0;

//   /// Reviews
//   bool reviewsLoading = true;
//   List<ReviewModel> reviews = [];
//   bool isReviewSubmitted = false;
//   int reviewCount = 0;
//   double reviewRating = 0.0;

//   ///Poduct Purchases
//   int productPurchasesCount = 0;
//   bool userPurchasedProduct = false;

//   ///bool haveThieProducr = false;

//   RxBool sendCommentISLoading = false.obs;
//   RxDouble ratingValue = 5.0.obs;
//   int maxCommentLenght = 500;
//   RxDouble commentLength = 0.0.obs;

//   calculatePercentage(int textLemghth) {
//     if (textLemghth > maxCommentLenght) {
//       commentLength.value = 1.0; // لا تتجاوز النسبة 1.0
//     }
//     commentLength.value = textLemghth / maxCommentLenght;
//   }

//   @override
//   void onInit() {
//     user = _supabase.auth.currentUser!;
//     uid = user!.id;
//     images.insert(0, imageUrl);
//     _fitchProductImages();
//     _checkIfProductFavorited();
//     _fitchProductDetails();

//     // debugPrint('Initializing ProductDetails');
//     // _initializing();
//     // _checkIfProductFavorited(product.id!);

//     super.onInit();
//   }

//   @override
//   void onClose() {
//     _saveData();
//     super.onClose();
//   }

//   void _fitchProductImages() async {
//     try {
//       final response = await _supabase
//           .from(KEYS.PRODUCT_IMAGES_TABLE)
//           .select(KEYS.IMAGE_URL)
//           .eq(KEYS.PRODUCT_ID, productId);

//       if (response.isEmpty) return;

//       List<String> imagesList =
//           response.map((e) => e['image_url'] as String).toList();

//       images.addAll(imagesList);
//       imagesCount.value = images.length;
//     } catch (error) {
//       debugPrint('Error initializing product images: $error');
//     } finally {
//       update();
//     }
//   }

//   void _checkIfProductFavorited() {
//     try {
//       final result =
//           _storage.read(STORAGE_KEYS.FAVORITE_PRODUCTS + uid) ?? '[]';
//       favoriteProducts = List<int>.from(jsonDecode(result));
//       isProductFavorited = favoriteProducts.contains(productId);
//     } catch (error) {
//       debugPrint('error : ${error.toString()}');
//       throw 'An error occurred while favorites';
//     } finally {
//       update();
//     }
//   }

//   Future<void> _fitchProductDetails() async {
//     try {
//       final response = await _supabase
//           .from(KEYS.PRODUCTS_TABLE)
//           .select()
//           .eq(KEYS.ID, productId);

//       if (response.isEmpty) return;

//       product = ProductModel.fromJson(response[0]);
//       _fitchProductFRV();
//     } catch (error) {
//       debugPrint('Error initializing product details: $error');
//     } finally {
//       isLoading = false;
//       update();
//     }
//   }

//   Future<void> _fitchProductFRV() async {
//     try {
//       await _getReviews();
//       await _getPurchases();
//       favoriteCount = product!.favoriteCount;
//       viewsCount = product!.viewsCount;
//     } catch (error) {
//       debugPrint('error : ${error.toString()}');
//     } finally {
//       isLoadingFRV = false;
//       update();
//     }
//   }

//   Future<void> _getReviews() async {
//     try {
//       final response = await _supabase
//           .from(KEYS.REVIEWS_TABLE)
//           .select('*, profiles: user_id (*)')
//           .eq(KEYS.PRODUCT_ID, productId);

//       if (response.isEmpty) return;

//       /// get all reviews
//       reviews =
//           response
//               .map((e) => ReviewModel.fromJson(e))
//               .toList()
//               .reversed
//               .toList();

//       /// check if user has submitted review
//       isReviewSubmitted = reviews.any((e) => e.userId == uid);

//       /// calculate review count
//       reviewCount = response.length;

//       /// calculate review rating
//       reviewRating =
//           reviews.map((e) => e.ratingValue ?? 0.0).reduce((a, b) => a + b) /
//           reviews.length;
//     } catch (error) {
//       debugPrint('error : ${error.toString()}');
//       throw 'An error occurred while reviews';
//     }
//   }

//   Future<void> _getPurchases() async {
//     try {
//       final response = await _supabase
//           .from(KEYS.PURCHASES_TABLE)
//           .select()
//           .eq(KEYS.PRODUCT_ID, productId);

//       if (response.isNotEmpty) {
//         productPurchasesCount = response.length;
//         userPurchasedProduct = response.any((e) => e['user_id'] == uid);
//       }
//     } catch (error) {
//       debugPrint('error : ${error.toString()}');
//       throw 'An error occurred while Purchases';
//     }
//   }

//   Future<void> toggleFavorite() async {
//     if (isProductFavorited) {
//       favoriteProducts.remove(productId);
//       favoriteCount == 0
//           ? favoriteCount = 0
//           : favoriteCount = (favoriteCount ?? 0) - 1;
//     } else {
//       favoriteProducts.add(productId);
//       favoriteCount = (favoriteCount ?? 0) + 1;
//     }

//     isProductFavorited = !isProductFavorited;
//     update();
//   }

//   Future<bool> sendReview(ReviewModel review) async {
//     sendCommentISLoading.value = true;
//     try {
//       await _supabase.from(KEYS.REVIEWS_TABLE).insert(review.toJson());
//       await _fitchProductFRV();
//       ratingValue.value = 5.0;
//       return true;
//     } catch (error) {
//       debugPrint('error : ${error.toString()}');
//       CustomNotification.showSnackbar(message: 'send Comment Error');
//       return false;
//     } finally {
//       sendCommentISLoading.value = false;
//     }
//   }

//   Future<void> _saveData() async {
//     try {
//       await _storage.write(
//         STORAGE_KEYS.FAVORITE_PRODUCTS + uid,
//         jsonEncode(favoriteProducts),
//       );
//       if (product == null) return;
//       await _supabase
//           .from(KEYS.PRODUCTS_TABLE)
//           .update({
//             KEYS.FAVORITE_COUNT: favoriteCount,
//             KEYS.VIEWS_COUNT: (viewsCount ?? 0) + 1,
//           })
//           .eq(KEYS.ID, productId);
//     } catch (error) {
//       debugPrint('error : ${error.toString()}');
//     }
//   }
// }
