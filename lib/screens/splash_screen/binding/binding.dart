import 'package:application/utils/import.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
