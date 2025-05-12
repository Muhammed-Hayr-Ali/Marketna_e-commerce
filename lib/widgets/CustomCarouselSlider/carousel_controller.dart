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
  set currentPage(int value) => _currentPage.value = value;

  final RxBool _isPaused = false.obs;
  bool get isPaused => _isPaused.value;

  Timer? _autoPlayTimer;

  @override
  void onInit() {
    super.onInit();
    _loadProducts(
      qualityId: qualityId,
      limit: limit,
      isAscending: reverseOrder,
    );
  }

  Future<void> _loadProducts({
    required int qualityId,
    required bool isAscending,
    required int limit,
  }) async {
    try {
      _isLoading.value = true;
      final response = await _supabase
          .from(TableNames.productDetails)
          .select('${ColumnNames.id}, ${TableNames.productImages}(image_url)')
          .eq(ColumnNames.qualityId, qualityId)
          .limit(limit)
          .order(ColumnNames.createdAt, ascending: isAscending);

      if (response.isEmpty) return;
      _products.value = response.map(ProductPreview.fromJson).toList();
      _startAutoPlayTimer();
    } finally {
      _isLoading.value = false;
    }
  }

  void _startAutoPlayTimer() {
    if (_autoPlayTimer != null) {
      _autoPlayTimer!.cancel();
    }

    if (_isPaused.value) return;

    _autoPlayTimer = Timer(autoPlayDuration, () {
      pageController.nextPage(
        duration: animationDuration,
        curve: Curves.easeInOut,
      );
      _startAutoPlayTimer();
    });
  }

  void togglePause() {
    _isPaused.value = !isPaused;
    _startAutoPlayTimer();
  }

  @override
  void onClose() {
    pageController.dispose();
    _autoPlayTimer?.cancel();
    super.onClose();
  }
}
