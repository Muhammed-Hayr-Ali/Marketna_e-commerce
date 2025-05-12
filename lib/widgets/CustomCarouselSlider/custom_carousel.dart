import 'package:application/constants/import.dart';
import 'package:application/widgets/CustomCarouselSlider/carousel_controller.dart';

class CustomCarousel extends StatelessWidget {
  final int qualityId;
  final int limit;
  final bool reverseOrder;
  final double aspectRatio;
  final Duration autoPlayDuration;
  final Duration animationDuration;
  final double padding;
  final void Function(int productId)? onTap;

  const CustomCarousel({
    super.key,
    required this.qualityId,
    this.limit = 10,
    this.reverseOrder = false,
    this.aspectRatio = 21 / 9,
    this.autoPlayDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 300),
    this.onTap,
    this.padding = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(
      CustomCarouselSliderController(
        qualityId: qualityId,
        limit: limit,
        reverseOrder: reverseOrder,
        autoPlayDuration: autoPlayDuration,
        animationDuration: animationDuration,
      ),
    );

    final controller = Get.find<CustomCarouselSliderController>();

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Obx(
        () =>
            controller.isLoading
                ? _shimmerPlaceholder(padding: padding)
                : controller.products.isEmpty
                ? _emptyImagePlaceholder(padding: padding)
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.products.length * 1000,
                      onPageChanged:
                          (index) =>
                              controller.currentPage =
                                  index % controller.products.length,
                      itemBuilder: (context, index) {
                        final productIndex = index % controller.products.length;
                        final product = controller.products[productIndex];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          child: CustomInkk(
                            onTap: () => onTap!(product.id!),
                            onLongPress: controller.togglePause,
                            child: _imageBuilder(imageUrl: product.imageUrl),
                          ),
                        );
                      },
                    ),

                    //// Indicator
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomIndicator(
                        length: controller.products.length,
                        currentIndex: controller.currentPage,
                        animationDuration: animationDuration,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
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

Widget _imageBuilder({required String? imageUrl}) {
  if (imageUrl == null) return _emptyImagePlaceholder();
  final controller = Get.find<CustomCarouselSliderController>();

  return Stack(
    children: [
      CachedNetworkImage(
        imageUrl: imageUrl,
        cacheKey: imageUrl,
        placeholder: (context, __) => _shimmerPlaceholder(),
        errorWidget: (context, __, ___) => _errorPlaceholder(),
        imageBuilder:
            (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
      ),
      Obx(() => SizedBox(child: controller.isPaused ? _paused() : null)),
    ],
  );
}

Widget _shimmerPlaceholder({double padding = 0.0}) {
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

Widget _emptyImagePlaceholder({double padding = 0.0}) {
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
