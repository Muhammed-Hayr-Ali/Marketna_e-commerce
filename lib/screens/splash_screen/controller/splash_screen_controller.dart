import 'package:application/utils/import.dart';

class SplashScreenController extends GetxController {
  /// Variables
  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();
  final _internetChecker = InternetConnectionChecker.createInstance();
  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  Future<void> initializeApp() async {
    try {
      _errorMessage.value = '';

      final hasInternetConnection = await Future<bool>.delayed(
        Duration(seconds: 1),
        () async {
          return await _internetChecker.hasConnection.timeout(
            const Duration(seconds: 5),
          );
        },
      );

      if (!hasInternetConnection) {
        _errorMessage.value = 'No Internet Connection Available';
      } else {
        await _checkAuthenticationStatus();
      }
    } on TimeoutException {
      _errorMessage.value = 'Connection Time Out Please try again';
    } catch (e) {
      _errorMessage.value = 'Something has gone wrong somewhere, and we will try to fix it right away.';
    }
  }

  Future<void> _checkAuthenticationStatus() async {
    try {
      final userResponse = await _supabase.auth.getUser();
      if (userResponse.user != null) {
        Get.offAllNamed(Routes.MAIN_SCREEN);
      } else {
        await _checkFirstLaunch();
      }
    } on AuthException {
      await _checkFirstLaunch();
    }
  }

  Future<void> _checkFirstLaunch() async {
    final isFirstLaunch =
        _storage.read<bool>(STORAGE_KEYS.FIRST_LAUNCH) ?? true;
    if (isFirstLaunch) {
      await _storage.write(STORAGE_KEYS.FIRST_LAUNCH, false);
      Get.offAllNamed(Routes.ONBOARDING_SCREEN);
    } else {
      Get.offAllNamed(Routes.SIGN_IN_SCREEN);
    }
  }
}
