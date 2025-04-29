import 'package:application/utils/import.dart';

class OnboardingController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  final RxDouble _loadingValue = 0.0000.obs;
  double get loadingValue => _loadingValue.value;

  final pageController = PageController();

  void changeSelectedIndex(int index) {
    _loadingValue.value = (index / 2);
  }

  void nextPage() => pageController.nextPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeIn,
  );

  void goToAhth() => Get.offAllNamed(Routes.LOGIN_SCREEN);
}
