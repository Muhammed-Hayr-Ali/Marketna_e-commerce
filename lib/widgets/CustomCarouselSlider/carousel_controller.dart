import 'package:application/constants/import.dart';

class CustomCarouselSliderController extends GetxController {
  final int qualityId;
  final int limit;
  final bool reverseOrder;
  final Duration autoPlayDuration;
  final Duration animationDuration;

  CustomCarouselSliderController({
    required this.qualityId,
    required this.limit,
    required this.reverseOrder,
    required this.autoPlayDuration,
    required this.animationDuration,
  });

  final _supabase = Supabase.instance.client;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  final RxList<ProductPreview> _products = <ProductPreview>[].obs;
  List<ProductPreview> get products => _products;

  final PageController pageController = PageController(initialPage: 0);

  final RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;
  /// seeter
  set currentPage(int value) => _currentPage.value = value;


  final RxBool _isPaused = false.obs;
  bool get isPaused => _isPaused.value;
  


  Timer? _autoPlayTimer;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(qualityId: 2, limit: limit, isAscending: reverseOrder);
  }

  Future<void> fetchProducts({
    required int qualityId,
    int limit = 10,
    bool isAscending = false,
  }) async {
    try {
      final response = await _supabase
          .from(TableNames.productDetails)
          .select('${ColumnNames.id}, ${TableNames.productImages}(image_url)')
          .eq(ColumnNames.qualityId, qualityId)
          .limit(limit)
          .order(ColumnNames.createdAt, ascending: isAscending);

      if (response.isEmpty) return;

      _products.value = response.map(ProductPreview.fromJson).toList();
      startAutoPlayTimer();
    } catch (error) {
      debugPrint('Error fetching products: $error');
    } finally {
      _isLoading.value = false;
    }
  }

  void startAutoPlayTimer() {
    /// Cancel the auto play timer if it's already running
    if (_autoPlayTimer != null) {
      _autoPlayTimer!.cancel();
    }

    if (_isPaused.value) return;

    _autoPlayTimer = Timer(autoPlayDuration, () {
      pageController.nextPage(
        duration: animationDuration,
        curve: Curves.easeInOut,
      );
      startAutoPlayTimer();
    });
  }

  void togglePause() {
    _isPaused.value = !isPaused;
    update();
    startAutoPlayTimer();
  }

  void onTapProduct(void Function(int)? onTap, int? productId) {
    if (onTap != null && productId != null) {
      onTap(productId);
    }
    togglePause();
  }

  @override
  void onClose() {
    pageController.dispose();
    _autoPlayTimer?.cancel();
    super.onClose();
  }
}
