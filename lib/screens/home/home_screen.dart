import 'package:application/constants/import.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText('HomeScreen'),

          GetBuilder<HomeController>(
            init: HomeController(),
            builder:
                (controller) => CustomCarouselSlider(
                  onTap:
                      (productId) => Get.toNamed(
                        Routes.PRODUCT_DETAILS,
                        arguments: productId,
                      ),
                ),
          ),
        ],
      ),
    );
  }
}
