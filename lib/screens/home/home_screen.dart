import 'package:application/services/upload_data.dart';
import 'package:application/utils/import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText('Home'),
      ),
      body: Center(
        child: CustomButton(
          width: 100,
          height: 40,
          borderRadius: 60,
          onPressed:
              () => UploadData().uploadDataToSupabase(
                filePath: 'assets/data/products.json',
                table: 'products',
              ),
          child: CustomText('send'.tr),
        ),
      ),
    );
  }
}
