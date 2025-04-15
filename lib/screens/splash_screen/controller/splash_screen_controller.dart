import 'package:application/utils/import.dart';

class SplashScreenController extends GetxController {
  final supabase = Supabase.instance.client;
  final localStorage = AppStorage();
  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  Future<void> initializeApp() async {
    try {
      loading.value = true;
      await _checkInternetConnection();
      await _handleFirstTimeLaunch();
    } catch (error) {
      _handleInitializationError(error);
    } finally {}
  }

  Future<void> _checkInternetConnection() async {
    debugPrint('Checking internet connection...');
    final isConnected = await InternetConnectionChecker.instance.hasConnection;
    if (!isConnected) {
      loading.value = false;
      throw Exception('no_internet_connection'); // لإيقاف عملية التهيئة
    }
  }

  Future<void> _handleFirstTimeLaunch() async {
    debugPrint('Checking first time launch...');
    final isFirstTime = await localStorage.read(
      key: AppStorageKey.firstTime,
      defaultValue: true,
    );
    if (isFirstTime == true) {
      _navigateToScreen(AppRoutes.onboardingScreen);
      await localStorage.write(key: AppStorageKey.firstTime, value: false);
    } else {
      _checkAuthentication();
    }
  }

  Future<void> _checkAuthentication() async {
    debugPrint('Checking authentication...');
    bool isAuth = await _fetchUserIdentities();
    _navigateToScreen(isAuth ? AppRoutes.mainScreen : AppRoutes.loginScreen);
  }

  Future<bool> _fetchUserIdentities() async {
    debugPrint('Fetching user identities...');
    try {
      final identities = await supabase.auth.getUserIdentities();
      debugPrint('User identities fetched successfully');
      return identities.isNotEmpty;
    } on AuthException catch (e) {
      debugPrint('Error fetching user identities: ${e.message}');
      return false;
    }
  }

  void _navigateToScreen(String route) {
    debugPrint('Navigating to $route...');
    Get.offAllNamed(route);
  }

  void _handleInitializationError(Object error) {
    debugPrint('Error initializing app: $error');
    CustomNotification.showSnackbar(message: error.toString());
  }

  void retry() => initializeApp();
}
