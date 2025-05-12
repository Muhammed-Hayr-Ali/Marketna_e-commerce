import 'package:application/constants/import.dart';
import 'package:application/widgets/CustomCarouselSlider/custom_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText('HomeScreen'),
          CustomCarousel(
            qualityId: 2,
            onTap: (productId) {
              debugPrint(productId.toString());
            },
          ),
        ],
      ),
    );
  }
}
