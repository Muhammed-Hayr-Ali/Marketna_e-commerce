import 'package:application/utils/import.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Map<String, dynamic>? ?? {};
    if (product[KEYS.ID] == null || product == {}) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: CustomText('Product Not Found')),
      );
    }

    Get.put(
      ProductDetailsController(
        productId: product[KEYS.ID],
        imageUrl: product[KEYS.IMAGE_URL],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================
            // ** Product Images **
            // ==============================
            SizedBox(
              height: Get.width * 1.1,
              width: double.infinity,

              child: Stack(
                children: [
                  /// Images
                  _productImages(productId: product[KEYS.ID]),

                  /// Top Bar
                  _topBar(),

                  /// Image Cont
                  _indicator(),
                ],
              ),
            ),

            // ==============================
            // ** Product Details **
            // ==============================
            GetBuilder<ProductDetailsController>(
              builder:
                  (controller) =>
                      controller.isLoading
                          /// Loading Placeholder
                          ? _loadingPlaceholder()
                          : controller.product == null
                          /// Error Placeholder
                          ? _errorPlaceholder()
                          /// Product Details
                          : _productDetails(controller),
            ),
          ],
        ),
      ),
    );
  }
}
// ==============================
// ** Product Images **
// ==============================

/// Images
Widget _productImages({required int productId}) {
  return Hero(
    tag: productId,
    child: GetBuilder<ProductDetailsController>(
      builder:
          (controller) =>
              controller.images.length == 1
                  ? _image(controller.images.first)
                  : PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.images.length,
                    itemBuilder:
                        (context, index) => _image(controller.images[index]),
                    onPageChanged:
                        (index) => controller.currentImageIndex.value = index,
                  ),
    ),
  );
}

Widget _image(String imageUrl) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      imageBuilder:
          (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.0),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
      placeholder:
          (context, url) => CustomPlaceholder.loading(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(28.0),
              ),
            ),
          ),
      errorWidget:
          (context, url, error) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(28.0),
            ),
            child: Icon(Icons.error, color: Colors.red),
          ),
    ),
  );
}

/// Image Cont
Widget _indicator() {
  final controller = Get.find<ProductDetailsController>();

  return Obx(() {
    return controller.imagesCount.value > 1
        ? Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIndicator(
              length: controller.imagesCount.value,
              currentIndex: controller.currentImageIndex.value,
            ),
          ),
        )
        : Container();
  });
}

/// Top Bar
Widget _topBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCicularButton(
          size: 20,
          backgroundColor: Colors.white54,
          child: Icon(Icons.arrow_back, size: 20.0, color: Colors.white),
          onPressed: () => Get.back(),
        ),

        GetBuilder<ProductDetailsController>(
          builder:
              (controller) => CustomCicularButton(
                size: 20,
                backgroundColor: Colors.white54,
                onPressed: controller.toggleFavorite,
                child: Icon(
                  controller.isProductFavorited
                      ? PhosphorIconsFill.heart
                      : PhosphorIconsRegular.heart,
                  size: 20.0,
                  color:
                      controller.isProductFavorited ? Colors.red : Colors.white,
                ),
              ),
        ),
      ],
    ),
  );
}

// ==============================
// ** Product Details **
// ==============================

/// Loading Placeholder
Widget _loadingPlaceholder() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: CustomPlaceholder.loading(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Reviews
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            height: 18.0,
            width: Get.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),

          /// Product Name
          Container(
            height: 29.0,
            width: Get.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          const SizedBox(height: 4.0),

          /// Category
          Container(
            height: 17.0,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          const SizedBox(height: 12.0),

          /// Price
          Container(
            height: 23.0,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          const SizedBox(height: 16.0),

          /// Description
          Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ],
      ),
    ),
  );
}

/// Error Placeholder
Widget _errorPlaceholder() {
  return Expanded(child: Center(child: CustomText('No Product Found')));
}

/// Product Details
Widget _productDetails(var controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Reviews
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(PhosphorIconsRegular.heart, size: 14),
              const SizedBox(width: 4.0),
              CustomText('${controller.favoriteCount}', fontSize: 10),
              const SizedBox(width: 10.0),
              Icon(PhosphorIconsRegular.star, size: 14),
              const SizedBox(width: 4.0),
              CustomText(
                controller.reviewRating.toStringAsFixed(1),
                fontSize: 10,
              ),
              const SizedBox(width: 4.0),
              CustomText(
                '(${controller.reviewCount} Reviews)',
                fontSize: 8,
                color: Colors.grey,
              ),
              const SizedBox(width: 10.0),
              Icon(PhosphorIconsRegular.eye, size: 14),
              const SizedBox(width: 4.0),
              CustomText(
                DataConverter.formatViews(controller.viewsCount),
                fontSize: 10,
              ),
            ],
          ),
        ),

        /// Product Name
        CustomText(
          controller.product!.name ?? '',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),

        /// Category
        CustomText(
          controller.product!.category ?? 'No Category',
          fontSize: 12,
          color: Colors.grey,
        ),
        const SizedBox(height: 12.0),

        /// Price
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///   Old Price
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                CustomText(
                  controller.product!.oldPrice != null ? '\$' : '',
                  fontSize: 8.0,
                  color: Colors.grey,
                ),
                SizedBox(width: 2),
                CustomText(
                  controller.product!.oldPrice != null
                      ? '${controller.product!.oldPrice}'
                      : '',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                ),
              ],
            ),
            SizedBox(width: controller.product!.oldPrice != null ? 8.0 : 0),

            /// New Price
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  controller.product!.price != null ? '\$' : '',
                  fontSize: 8.0,
                  color: Colors.grey,
                ),
                SizedBox(width: 2),
                CustomText(
                  controller.product!.price != null
                      ? '${controller.product!.price}'
                      : '',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16.0),

        /// Description
        Text(controller.product!.description ?? 'No Description'),
      ],
    ),
  );
}
