import 'package:application/constants/import.dart';

class CustomCarouselSlider extends StatefulWidget {
  final Duration animationDuration;
  final Duration autoPlayDuration;
  final double aspectRatio;
  final int pauseDurationInSeconds;
  final bool reverseOrder;
  final void Function(int productId)? onTap;

  const CustomCarouselSlider({
    super.key,
    this.onTap,
    this.reverseOrder = false,
    this.aspectRatio = 21 / 9,
    this.pauseDurationInSeconds = 5,
    this.autoPlayDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  /// variables

  final _supabase = Supabase.instance.client;
  List<ProductPreview> _processedProducts = [];
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _initializeProducts();
  }

  Future<void> _initializeProducts() async {
    final fetchedProducts = await _fetchProducts(
      qualityId: 2,
      isAscending: widget.reverseOrder,
    );

    if (fetchedProducts.isEmpty) {
      return;
    }

    setState(() {
      _processedProducts = fetchedProducts;
    });

    _startAutoPlayTimer();
  }

  Future<List<ProductPreview>> _fetchProducts({
    required int qualityId,
    int limit = 10,
    bool isAscending = false,
  }) async {
    final table = _supabase.from(TableNames.productDetails);
    final select = table
        .select('${ColumnNames.id}, ${TableNames.productImages}(image_url)')
        .eq(ColumnNames.qualityId, qualityId)
        .limit(limit)
        .order(ColumnNames.createdAt, ascending: isAscending);

    final response = await select;
    if (response.isEmpty) return [];
    return response.map(ProductPreview.fromJson).toList();
  }

  Timer? _autoPlayTimer;

  void _startAutoPlayTimer() {
    if (_autoPlayTimer != null) {
      _autoPlayTimer!.cancel();
    }

    final duration = _isPaused ? _pauseDuration : _autoPlayDuration;
    _autoPlayTimer = Timer(duration, () {
      if (!mounted || _isPaused) return;

      _pageController.nextPage(
        duration: _animationDuration,
        curve: Curves.easeInOut,
      );
      _startAutoPlayTimer();
    });
  }

  Duration get _pauseDuration =>
      Duration(seconds: widget.pauseDurationInSeconds);
  Duration get _autoPlayDuration => widget.autoPlayDuration;
  Duration get _animationDuration => widget.animationDuration;

  @override
  void dispose() {
    _pageController.dispose();
    _autoPlayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_processedProducts.isEmpty) {
      return _emptyPlaceholder(widget.aspectRatio);
    }

    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount:
                _processedProducts.length * 1000, // Infinite scrolling effect
            onPageChanged: (index) {
              setState(() {
                _currentPage = index % _processedProducts.length;
              });
            },
            itemBuilder: (context, index) {
              final productIndex = index % _processedProducts.length;
              final product = _processedProducts[productIndex];

              return GestureDetector(
                onTap: () {
                  if (widget.onTap != null && product.id != null) {
                    widget.onTap!(product.id!);
                  }
                },
                onLongPress: () {
                  _isPaused = !_isPaused;
                  _startAutoPlayTimer();
                  CustomNotification.showToast(
                    message: _isPaused ? AppStrings.pause : AppStrings.resume,
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl ?? '',
                  cacheKey: product.imageUrl,
                  placeholder:
                      (_, __) => _shimmerPlaceholder(widget.aspectRatio),
                  errorWidget:
                      (_, __, ___) => _errorPlaceholder(widget.aspectRatio),
                  imageBuilder:
                      (context, imageProvider) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomIndicator(
              length: _processedProducts.length,
              currentIndex: _currentPage,
              animationDuration: widget.animationDuration,
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerPlaceholder(double aspectRatio) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Shimmer.fromColors(
          baseColor: const Color(0xFFF5F5F5),
          highlightColor: const Color(0xFFEEEEEE),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorPlaceholder(double aspectRatio) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(child: Icon(Icons.error, color: Colors.grey)),
        ),
      ),
    );
  }
}

Widget _emptyPlaceholder(double aspectRatio) {
  return AspectRatio(
    aspectRatio: aspectRatio,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
