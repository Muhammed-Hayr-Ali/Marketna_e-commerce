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
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomButton(
                isLoading: _.isLoading.value,
                onPressed: _.addNewCountry,
                width: Get.width * 0.5,
                backgroundColor: AppColors.grey,
                child: CustomText('Add New Country'),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: CustomButton(
                isLoading: _.isLoading.value,
                onPressed: _.loginUser,
                width: Get.width * 0.5,
                backgroundColor: AppColors.grey,
                child: CustomText('Login User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
