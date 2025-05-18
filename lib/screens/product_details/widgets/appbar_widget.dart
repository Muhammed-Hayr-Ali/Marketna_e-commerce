import 'package:application/constants/import.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key});
  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCicularButton(
            size: 40,
            backgroundColor: Colors.black26,
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          GetBuilder<ProductDetailsController>(
            builder:
                (controller) => CustomCicularButton(
                  size: 40,
                  backgroundColor: Colors.black26,
                  onPressed: controller.toggleFavoriteProduct,
                  child: Icon(
                    controller.isFavorite
                        ? PhosphorIconsFill.heart
                        : PhosphorIconsRegular.heart,
                    size: 20.0,
                    color: controller.isFavorite ? Colors.red : Colors.white,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
