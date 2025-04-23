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

  /// Initializes the application by checking the internet connection and
  /// handling the first launch of the app (by navigating to the onboarding
  /// screen if it is the first time the app is launched). If an error occurs
  /// during the initialization, it will be handled by the [_handleError]
  /// method.
  ///
  /// This method is called when the controller is initialized, and it is
  /// expected to be called only once.
  Future<void> initializeApp() async {
    try {
      loading.value = true;
      await _checkInternet();
      await _handleFirstLaunch();
    } catch (error) {
      _handleError(error);
    } finally {}
  }

  /// Checks if there is an internet connection available.
  ///
  /// If there is no internet connection available, it will throw an
  /// [Exception] with the message 'No internet connection'. If there is an
  /// internet connection available, this method will just return without
  /// throwing any exceptions.
  ///
  /// When this method is called, it will set the [loading] variable to false,
  /// so the loading indicator will be hidden.
  Future<void> _checkInternet() async {
    final hasInternetConnection =
        await InternetConnectionChecker.instance.hasConnection;
    if (!hasInternetConnection) {
      loading.value = false;
      throw Exception('No internet connection');
    }
  }

  /// Checks if the app is launched for the first time and navigates to the
  /// onboarding screen if it is the first time, or checks if the user is
  /// authenticated if it is not the first time.
  ///
  /// If the app is launched for the first time, this method will navigate to
  /// the onboarding screen and set the first time launch flag to false in
  /// the local storage. If the app is not launched for the first time, this
  /// method will check if the user is authenticated and navigate to the main
  /// screen if the user is authenticated, or navigate to the login screen if
  /// the user is not authenticated.
  Future<void> _handleFirstLaunch() async {
    final isFirstTimeLaunch = await localStorage.read<bool>(
      key: AppStorageKey.FIRST_TIME_LAUNCH,
      defaultValue: true,
    );
    if (isFirstTimeLaunch == null || isFirstTimeLaunch) {
      _navigateToScreen(Routes.ONBOARDING_SCREEN);
      await localStorage.write(
        key: AppStorageKey.FIRST_TIME_LAUNCH,
        value: false,
      );
    } else {
      await _checkAuthentication();
    }
  }

  /// Checks if the user is authenticated and navigates to the main screen
  /// if authenticated, or the login screen if not authenticated.
  ///
  /// This method will try to fetch the user from the Supabase client. If the
  /// user is found, it will navigate to the main screen. If the user is not
  /// found, it will navigate to the login screen instead.
  Future<void> _checkAuthentication() async {
    final isAuthenticated = await _hasAuthenticatedUser();
    _navigateToScreen(
      isAuthenticated ? Routes.MAIN_SCREEN : Routes.LOGIN_SCREEN,
    );
  }

  /// Checks if the user is authenticated.
  ///
  /// This method will try to fetch the user from the Supabase client. If the
  /// user is found, it will return true. If the user is not found, it will
  /// return false and print an error message to the console.
  ///
  /// This method is used to check if the user is authenticated before
  /// navigating to the main screen. If the user is not authenticated, it
  /// will navigate to the login screen instead.
  Future<bool> _hasAuthenticatedUser() async {
    try {
      await supabase.auth.getUser();
      return true;
    } on AuthException catch (e) {
      debugPrint('Error fetching user: ${e.message}');
      return false;
    }
  }

  /// Navigates to the specified route using GetX's `Get.offAllNamed` method.
  ///
  /// This method will remove all existing routes from the stack and replace
  /// them with the new route specified by [routeName]. It is typically used
  /// for navigating to a new screen and clearing the navigation history so
  /// that the user cannot go back to the previous screens.
  ///
  /// - Parameter routeName: The name of the route to navigate to.

  void _navigateToScreen(String routeName) {
    Get.offAllNamed(routeName);
  }

  /// Handles any errors that occur during the initialization of the app.
  /// If an error occurs, a snackbar with the error message is displayed.
  void _handleError(dynamic error) {
    CustomNotification.showSnackbar(message: error.toString());
    debugPrint(error.toString());
  }

  void retry() => initializeApp();
}
