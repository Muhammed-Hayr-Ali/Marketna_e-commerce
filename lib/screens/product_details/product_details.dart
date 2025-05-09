import 'package:application/constants/import.dart';

class ProductDetailsWidget extends StatelessWidget {
  ProductDetailsWidget({super.key});
  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return CustomText(controller.product!.name ?? '');
  }
}
