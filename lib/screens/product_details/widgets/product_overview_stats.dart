import 'package:application/constants/import.dart';

class ProductOverviewStats extends StatelessWidget {
  ProductOverviewStats({super.key});

  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: GetBuilder<ProductDetailsController>(
        builder:
            (controller) => Row(
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
                const SizedBox(width: 10.0),
                Icon(PhosphorIconsRegular.basket, size: 14),
                const SizedBox(width: 4.0),
                CustomText(
                  DataConverter.formatViews(controller.userPurchasesCount),
                  fontSize: 10,
                ),
              ],
            ),
      ),
    );
  }
}
