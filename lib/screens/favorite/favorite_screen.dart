import 'package:application/constants/import.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final FavoriteController _ = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText('Favorite'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(_.message.value),
                SizedBox(height: 10.0),
                CustomButton(
                  isLoading: _.isLoading.value,
                  onPressed: _.upload,
                  width: Get.width * 0.5,
                  backgroundColor: AppColors.grey,
                  child: CustomText('Get Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
