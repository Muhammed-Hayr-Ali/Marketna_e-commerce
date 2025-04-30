import 'package:application/utils/import.dart';

class SplashScreenController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();
  final RxBool _isLoading = true.obs;
  final RxString _errorMessage = ''.obs;

  String get errorMessage => _errorMessage.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  /// Initializes the app.
  ///
  /// Checks if the user has an internet connection, and shows the onboarding
  /// screen if this is the first launch.
  ///
  /// Sets [isLoading] to false once the initialization is complete.
  Future<void> initializeApp() async {
    try {
      await _checkInternetConnection();
      await _handleFirstLaunch();
    } catch (error) {
      _errorMessage.value = error.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  /// Checks if the user has an internet connection.
  ///
  /// Throws an [AppException] with a message indicating that there is no internet
  /// connection if the user does not have an internet connection.
  Future<void> _checkInternetConnection() async {
    final hasConnection =
        await InternetConnectionChecker.instance.hasConnection;
    if (!hasConnection) {
      throw Exception(AppException.NO_INTERNET_CONNECTION);
    }
  }

  /// Handles the first launch of the app.
  ///
  /// Checks if the user has already launched the app before. If this is the first
  /// launch, shows the onboarding screen. Otherwise, checks the authentication
  /// status.
  Future<void> _handleFirstLaunch() async {
    final isFirstLaunch =
        _storage.read<bool>(STORAGE_KEYS.FIRST_LAUNCH) ?? true;
    if (isFirstLaunch) {
      await _showOnboarding();
    } else {
      await _checkAuthenticationStatus();
    }
  }

  /// Shows the onboarding screen.
  ///
  /// Writes [false] to the [StorageKeys.FIRST_LAUNCH] key to indicate that the
  /// user has already launched the app before.
  ///
  /// Navigates to the [Routes.ONBOARDING_SCREEN].
  Future<void> _showOnboarding() async {
    await _storage.write(STORAGE_KEYS.FIRST_LAUNCH, false);
    Get.toNamed(Routes.ONBOARDING_SCREEN);
  }

  /// Checks the authentication status of the user.
  ///
  /// Retrieves the user from the Supabase client. If the user is not null and
  /// the user's `user` property is not null, it navigates to the [Routes.MAIN_SCREEN].
  /// Otherwise, it navigates to the [Routes.LOGIN_SCREEN].
  ///
  /// If an error occurs during the retrieval of the user, it navigates to the
  /// [Routes.LOGIN_SCREEN].
  Future<void> _checkAuthenticationStatus() async {
    try {
      final user = await _supabase.auth.getUser();
      final isLoggedIn = user.user != null;
      final route = isLoggedIn ? Routes.MAIN_SCREEN : Routes.LOGIN_SCREEN;
      Get.offAndToNamed(route);
    } catch (error) {
      Get.offAndToNamed(Routes.LOGIN_SCREEN);
    }
  }

  /// Retries the app initialization.
  ///
  /// Sets [isLoading] to true, and calls [initializeApp].
  void retryInitialization() {
    _isLoading.value = true;
    _errorMessage.value = '';
    initializeApp();
  }
}
