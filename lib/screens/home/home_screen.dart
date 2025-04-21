import 'package:application/screens/home/controller/controller.dart';
import 'package:application/utils/import.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _ = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText('Home'),
      ),
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _.isLoading.value
                  ? CircularProgressIndicator()
                  : Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: CustomText(_.errorMessage.value,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
              CustomButton(
                isLoading: _.isLoading.value,
                width: 100,
                height: 40,
                borderRadius: 60,
                onPressed: _.uploadProductsToDatabase,
                child: CustomText('send'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
