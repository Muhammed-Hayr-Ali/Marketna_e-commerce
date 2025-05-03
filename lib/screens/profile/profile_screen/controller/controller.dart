import 'package:application/utils/import.dart';

class ProfileController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _main = ProfileMainController();

  bool isLoading = true;

  User? user;

  @override
  void onInit() {
    super.onInit();
    initializeCurrentUser();
  }

  /// Initializes the user by fetching the current user from Supabase.
  ///
  /// This function wraps the initialization of the user in a try-catch block to
  /// handle any exceptions that may be thrown when fetching the user.
  void initializeCurrentUser() {
    try {
      final currentUser = _supabase.auth.currentUser;
      user = currentUser;
    } on Exception {
      // Ignore exceptions
    } finally {
      isLoading = false;
      update();
    }
  }

  /// Signs the user out of the application.
  ///
  /// This function first prompts the user to confirm whether they want to sign out.
  /// If the user chooses to sign out, it will attempt to sign the user out using the
  /// Supabase client. If the sign out is successful, it will navigate to the login
  /// screen. If the sign out fails, it will show an error message in a snackbar.
  Future<void> signOut() async {
    // Prompt the user to confirm sign out
    bool shouldSignOut = await _main.shouldSignOut();
    if (!shouldSignOut) return;
    try {
      await _supabase.auth.signOut();
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  /// Initializes the current user.
  ///
  /// This function sets the current user to the user from the Supabase client's
  /// `currentUser` property and triggers a UI update.

  /// Navigates to the given route using GetX's `Get.toNamed` method.
  void navigateToScreen(String route) {
    Get.toNamed(route);
  }
}
