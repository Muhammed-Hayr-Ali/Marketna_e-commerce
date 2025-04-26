import 'package:application/utils/import.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Map<String, dynamic>? ?? {};
    if (product[KEYS.ID] == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: CustomText('Product Not Found')),
      );
    }

    Get.put(ProductDetailsController(productId: product[KEYS.ID]));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product[KEYS.ID]!,
                transitionOnUserGestures: true,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      height: Get.width * 1.1,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: product[KEYS.IMAGE_URL],
                      imageBuilder:
                          (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28.0),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      placeholder:
                          (context, url) => Center(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                              ),
                            ),
                          ),
                      errorWidget:
                          (context, url, error) =>
                              Icon(Icons.error, color: Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCicularButton(
                            size: 20,
                            backgroundColor: Colors.white54,
                            child: Icon(
                              Icons.arrow_back,
                              size: 20.0,
                              color: Colors.white,
                            ),
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
                                        controller.isProductFavorited
                                            ? Colors.red
                                            : Colors.white,
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<ProductDetailsController>(
                builder:
                    (controller) =>
                        controller.isLoading
                            ? _loadingPlaceholder()
                            : controller.product == null
                            ? CustomText('Product Not Found')
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 16.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        PhosphorIconsRegular.heart,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 4.0),
                                      CustomText(
                                        '${controller.favoriteCount}',
                                        fontSize: 10,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Icon(PhosphorIconsRegular.star, size: 14),
                                      const SizedBox(width: 4.0),
                                      CustomText(
                                        controller.reviewRating.toStringAsFixed(
                                          1,
                                        ),
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
                                        DataConverter.formatViews(
                                          controller.viewsCount,
                                        ),
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                CustomText(
                                  controller.product!.name ?? '',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 4.0),
                                CustomText(
                                  controller.product!.category ?? 'No Category',
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 8.0),
                                CustomText(
                                  controller.product!.price != null
                                      ? 'Price: \$${controller.product!.price}'
                                      : 'Price Not Available',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),

                                const SizedBox(height: 16.0),
                                Text(
                                  controller.product!.description ??
                                      'No Description',
                                ),
                              ],
                            ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _loadingPlaceholder() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          height: 18.0,
          width: Get.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          height: 29.0,
          width: Get.width * 0.6,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        const SizedBox(height: 4.0),
        Container(
          height: 17.0,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          height: 23.0,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        const SizedBox(height: 16.0),
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
  );
}
