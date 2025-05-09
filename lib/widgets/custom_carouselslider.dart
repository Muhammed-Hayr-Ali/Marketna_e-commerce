
import 'package:application/constants/import.dart';

class CustomCarouselSlider extends StatefulWidget {
  /// List of products to be displayed in the carousel slider.
  /// Each product should contain an `id` and `imageUrl` for displaying the image.
  final List<ProductModel> products;

  /// Placeholder widget to display while the carousel is loading.
  final Widget shimmerPlaceholder;

  /// Placeholder widget to display if there is an error loading the products.
  final Widget errorPlaceholder;

  /// Duration of the animation when switching between slides or dots.
  final Duration animationDuration;

  /// Duration of the auto-play interval between slides.
  final Duration autoPlayDuration;

  /// Aspect ratio of the carousel images (width / height).
  /// Default value is 21 / 9, which gives a wide-screen look.
  final double aspectRatio;

  /// Number of seconds to pause the auto-play when an image is tapped.
  final int pauseDurationInSeconds;

  /// Callback function triggered when an image is tapped.
  /// Provides the `productId` of the tapped product.
  final void Function(int productId)? onTap;

  /// Whether to reverse the order of the products in the carousel.
  /// If `true`, the list of products will be displayed in reverse order.
  final bool reverseOrder;

  const CustomCarouselSlider({
    super.key,
    required this.products, // List of products to display
    this.animationDuration = const Duration(
      milliseconds: 300,
    ), // Default animation duration
    this.autoPlayDuration = const Duration(
      seconds: 3,
    ), // Default auto-play interval
    this.aspectRatio = 21 / 9, // Default aspect ratio (wide-screen)
    this.pauseDurationInSeconds = 5, // Default pause duration on tap
    this.onTap, // Optional callback for image tap
    this.reverseOrder = false,
    required this.shimmerPlaceholder,
    required this.errorPlaceholder, // Whether to reverse the product order
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  /// Current page index of the carousel.
  /// This tracks the currently visible slide.
  int _currentPage = 0;

  /// PageController to manage the carousel's page transitions.
  late PageController _pageController;

  /// Whether the auto-play is paused.
  /// When true, the carousel stops auto-playing temporarily.
  bool _isPaused = false;

  /// Processed list of products after applying the `reverseOrder` logic.
  /// If `reverseOrder` is true, the list is reversed; otherwise, it remains as is.
  late List<ProductModel> _processedProducts;

  @override
  void initState() {
    super.initState();

    // Reverse the product list if `reverseOrder` is enabled.
    _processedProducts =
        widget.reverseOrder
            ? List.from(widget.products.reversed)
            : List.from(widget.products);

    // Initialize the PageController with the processed list.
    _pageController = PageController(
      initialPage: _processedProducts.length * 100,
    );
    _startAutoPlay(); // Start the auto-play functionality.
  }

  /// Starts the auto-play timer for the carousel.
  /// If `_isPaused` is true, the auto-play will wait for the specified pause duration.
  void _startAutoPlay() {
    Future.delayed(
      _isPaused
          ? Duration(seconds: widget.pauseDurationInSeconds)
          : widget.autoPlayDuration,
      () {
        if (!_isPaused) {
          _pageController.nextPage(
            duration: widget.animationDuration,
            curve: Curves.easeInOut,
          );
        }
        _startAutoPlay(); // Recursively call to continue auto-play.
      },
    );
  }

  @override
  void dispose() {
    _pageController
        .dispose(); // Dispose of the PageController to free resources.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio, // Set the aspect ratio for the carousel.
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller:
                _pageController, // Use the PageController for navigation.
            itemCount:
                _processedProducts.length *
                1000, // Repeat the list 1000 times for infinite scrolling.
            onPageChanged: (index) {
              setState(() {
                _currentPage =
                    index %
                    _processedProducts.length; // Update the current page index.
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (widget.onTap != null) {
                    widget.onTap!.call(
                          _processedProducts[index % _processedProducts.length].id!,
                    ); // Trigger the onTap callback with the product ID.
                  }
                  setState(() {
                    _isPaused = !_isPaused; // Toggle the auto-play pause state.
                  });
                },
                child: Hero(
                  tag:
                      _processedProducts[index % _processedProducts.length].id!,
                  transitionOnUserGestures: true,
                  // Use CachedNetworkImage to load and cache images.
                  child: CachedNetworkImage(
                    imageUrl:
                        _processedProducts[index % _processedProducts.length]
                            .imageUrl!,
                    imageBuilder:
                        (context, imageProvider) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    placeholder: (context, url) => _shimmerPlaceholder(),
                    errorWidget: (context, url, error) => _errorPlaceholder(),
                    fit: BoxFit.cover, // Ensure the image covers the container.
                  ),
                ),
              );
            },
          ),
          // Add animated dots at the bottom of the carousel.
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

  Widget _shimmerPlaceholder() {
    return Padding(
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
    );
  }

  Widget _errorPlaceholder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: Icon(Icons.error, color: Colors.grey.shade400)),
      ),
    );
  }
}
