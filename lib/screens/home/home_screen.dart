import 'package:application/constants/import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText('HomeScreen'),
          // GetBuilder<HomeController>(
          //   init: HomeController(),
          //   builder:
          //       (controller) =>
          //           controller.isLoading
          //               ? ShimmerPlaceholder()
          //               : controller.premiumProducts.isEmpty
          //               ? ErrorPlaceholder()
          //               : CustomCarouselSlider(
          //                 products: controller.premiumProducts,
          //                 shimmerPlaceholder: ShimmerPlaceholder(),
          //                 errorPlaceholder: ErrorPlaceholder(),
          //                 onTap:
          //                     (productId) => Get.toNamed(
          //                       Routes.PRODUCT_DETAILS,
          //                       arguments: productId,
          //                     ),
          //               ),
          // ),
  
        ],
      ),
    );
  }
}
