import 'package:application/utils/import.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText('Cart'),
      ),
      body: Center(child: CustomText('CartScreen')),
    );
  }
}
