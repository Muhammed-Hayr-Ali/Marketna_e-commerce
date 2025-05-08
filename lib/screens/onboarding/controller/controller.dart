import 'package:application/constants/import.dart';

class OnboardingController extends GetxController {
  final _storage = GetStorage();
  final _main = OnboardingMainController();

  final RxDouble _loadingValue = 0.0.obs;
  double get loadingValue => _loadingValue.value;
  int _selectedIndex = 0;

  final pageController = PageController();

  /// Updates the [_selectedIndex] and [_loadingValue] based on the given [index].
  ///
  /// The [_loadingValue] is updated by dividing the [index] by 2, which
  /// effectively maps the 0-2 index values to 0.0-1.0.
  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    _loadingValue.value = index / 2;
  }

  /// Navigates to the next page in the onboarding process.
  ///
  /// If the next index exceeds 2, navigates to the login screen.
  /// Otherwise, it advances to the next page using the [pageController]
  /// and updates the [_selectedIndex].

  void nextPage() {
    final int nextIndex = _selectedIndex + 1;
    if (nextIndex > 2) {
      Get.offAllNamed(Routes.SIGN_IN_SCREEN);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      _selectedIndex = nextIndex;
    }
  }

  /// Opens a dialog to select a language, and if the user selects a new
  /// language, it updates the locale of the app and saves the new language
  /// code to storage.
  Future<void> selectLanguage() async {
    final oldLanguageCode =
        _storage.read<String>(StorageKeys.localeCode) ??
        Get.deviceLocale!.languageCode;

    final newLanguageCode = await _main.openLanguage(oldLanguageCode);
    if (newLanguageCode == null) return;
    Get.updateLocale(Locale(newLanguageCode));
    _storage.write(StorageKeys.localeCode, newLanguageCode);
  }
}
