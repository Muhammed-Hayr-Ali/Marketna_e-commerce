import 'dart:async';

import 'package:application/utils/import.dart';

class SplashScreenController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _internetChecker = InternetConnectionChecker.createInstance();
  final _storage = GetStorage();

  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  Future<void> initializeApp() async {
    _errorMessage.value = '';

    try {
      final hasInternet = await _internetChecker.hasConnection;

      if (!hasInternet) {
        _errorMessage.value = 'no_internet_connection';
        return;
      }

      await _checkAuthenticationStatus();
    } on TimeoutException {
      _errorMessage.value = 'timeout_error';
    } catch (error) {
      _errorMessage.value = error.toString();
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
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    }
  }

  
}
