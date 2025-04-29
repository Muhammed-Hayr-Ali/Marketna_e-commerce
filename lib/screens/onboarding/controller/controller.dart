import 'package:application/utils/import.dart';

class OnboardingController extends GetxController {
  final _storage = GetStorage();
  final _main = OnboardingMainController();

  final RxDouble _loadingValue = 0.0.obs;
  double get loadingValue => _loadingValue.value;
  int _selectedIndex = 0;

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

  void selectLanguage() async {
    final oldLanguageCode =
        _storage.read(STORAGE_KEYS.LOCALE) ?? Get.deviceLocale;

    debugPrint('oldLanguageCode : $oldLanguageCode');
    final languageCode = await _main.openLanguage(oldLanguageCode);
    if (languageCode == null) return;

    Get.updateLocale(Locale(languageCode));
    debugPrint('languageCode : $languageCode');

    _storage.write(STORAGE_KEYS.LOCALE, languageCode);
  }
}
