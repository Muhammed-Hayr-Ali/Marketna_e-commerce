import 'package:application/screens/home/controller/controller.dart';
import 'package:application/utils/import.dart';
import 'package:application/widgets/custom_carouselslider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _pageController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText('Home'),
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            builder:
                (controller) =>
                controller.premiumProducts.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    :
                
                 CustomCarouselSlider(
                  products: controller.premiumProducts,
                  onTap:
                      (productId) => Get.toNamed(
                        Routes.PRODUCT_DETAILS,
                        arguments: productId,
                      ),
                  reverseOrder: true,
                  activeDotColor: AppColors.primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
