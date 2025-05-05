
import 'package:application/utils/import.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({super.key});
  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return CustomText(controller.product!.name ?? '');
    
  }
}