import 'package:application/constants/import.dart';

class CustomCarousel extends StatefulWidget {
  final int limit;
  final int qualityId;
  final double padding;
  final bool reverseOrder;
  final double aspectRatio;
  final Duration autoPlayDuration;
  final Duration animationDuration;
  final void Function(int productId)? onTap;

  const CustomCarousel({
    super.key,
    this.onTap,
    this.limit = 10,
    this.padding = 10.0,
    required this.qualityId,
    this.reverseOrder = false,
    this.aspectRatio = 21 / 9,
    this.autoPlayDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 300),

  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final _supabase = Supabase.instance.client;
  final _pageController = PageController(initialPage: 0);

  Timer? _autoPlayTimer;
  bool _isLoading = true;
  bool _isPaused = false;
  int currentIndex = 0;
  List<ProductPreview> _products = <ProductPreview>[];

  @override
  void initState() {
    super.initState();
    _loadProducts(
      qualityId: widget.qualityId,
      limit: widget.limit,
      isAscending: widget.reverseOrder,
    );
  }

  Future<void> _loadProducts({
    required int qualityId,
    required bool isAscending,
    required int limit,
  }) async {
    try {
      final response = await _supabase
          .from(TableNames.productDetails)
          .select('${ColumnNames.id}, ${TableNames.productImages}(image_url)')
          .eq(ColumnNames.qualityId, qualityId)
          .limit(limit)
          .order(ColumnNames.createdAt, ascending: isAscending);

      if (response.isEmpty) {
        return;
      }

      final products = response.map(ProductPreview.fromJson).toList();

      setState(() {
        _products = products;
        _isLoading = false;
      });

      _startAutoPlay();
    } catch (_) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();

    if (_isPaused) return;

    _autoPlayTimer = Timer(widget.autoPlayDuration, () {
      _pageController.nextPage(
        duration: widget.animationDuration,
        curve: Curves.easeInOut,
      );

      _startAutoPlay();
    });
  }

  void togglePause() {
    setState(() {
      _isPaused = !_isPaused;
    });
    _startAutoPlay();
  }

  @override
  dispose() {
    _pageController.dispose();
    _autoPlayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: _buildShimmerPlaceholder(padding: widget.padding),
      );
    }
    if (_products.isEmpty) {
      return AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: _buildEmptyImagePlaceholder(padding: widget.padding),
      );
    }

    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _products.length * 1000,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index % _products.length;
              });
            },
            itemBuilder: (context, index) {
              final productIndex = index % _products.length;
              final product = _products[productIndex];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.padding),
                child: CustomInkk(
                  onTap: () => widget.onTap?.call(product.id!),
                  onLongPress: togglePause,
                  child: _buildImage(
                    imageUrl: product.imageUrl,
                    isPaused: _isPaused,
                  ),
                ),
              );
            },
          ),
          _buildIndicator(length: _products.length, currentIndex: currentIndex),
        ],
      ),
    );
  }
}

Widget _buildIndicator({required int length, required int currentIndex}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: CustomIndicator(length: length, currentIndex: currentIndex),
  );
}

Widget _paused({double padding = 0.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Icon(
          PhosphorIconsFill.playPause,
          size: 32.0,
          color: AppColors.white,
        ),
      ),
    ),
  );
}

Widget _buildImage({required String? imageUrl, required bool isPaused}) {
  if (imageUrl == null) return _buildEmptyImagePlaceholder();

  return Stack(
    children: [
      CachedNetworkImage(
        imageUrl: imageUrl,
        cacheKey: imageUrl,
        placeholder: (context, imageUrl) => _buildShimmerPlaceholder(),
        errorWidget: (context, imageUrl, error) => _errorPlaceholder(),
        imageBuilder:
            (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
      ),
      SizedBox(child: isPaused ? _paused() : null),
    ],
  );
}

Widget _buildShimmerPlaceholder({double padding = 0.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
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
  );
}

Widget _buildEmptyImagePlaceholder({double padding = 0.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Icon(
          PhosphorIconsRegular.image,
          size: 32.0,
          color: Colors.grey.shade400,
        ),
      ),
    ),
  );
}

Widget _errorPlaceholder({double padding = 0.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(child: Icon(Icons.error, color: Colors.grey)),
    ),
  );
}
