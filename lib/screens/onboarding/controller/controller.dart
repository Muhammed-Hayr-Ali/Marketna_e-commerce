import 'package:application/utils/import.dart';

class OnboardingController extends GetxController {
  int _selectedIndex = 0;

  final RxDouble _loadingValue = 0.0000.obs;
  double get loadingValue => _loadingValue.value;

  final pageController = PageController();

  void changeSelectedIndex(int index) {
    _selectedIndex = index;
    _loadingValue.value = (index / 2);
  }

  void nextPage() {
    if (_selectedIndex == 2) {
      goToAhth();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void goToAhth() => Get.offAllNamed(Routes.LOGIN_SCREEN);
}
