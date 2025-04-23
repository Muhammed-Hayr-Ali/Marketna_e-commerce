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
      body: Obx(
        () => Column(
          children: [
            _pageController.products.isEmpty
                ? SizedBox()
                : CustomCarouselSlider(
                  products: _pageController.products,
                  // onTap: (productId) => debugPrint(productId.toString()),
                  onTap:
                      (productId) => Get.toNamed(
                        Routes.PRODUCT_DETAILS,
                        arguments: productId,
                      ),
                  reverseOrder: true,
                  activeDotColor: AppColors.primaryColor,
                ),
          ],
        ),
      ),
    );
  }
}
