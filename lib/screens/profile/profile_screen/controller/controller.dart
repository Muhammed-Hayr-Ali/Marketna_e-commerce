import 'package:application/utils/import.dart';

class ProfileController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _main = ProfileMainController();

  Map<String, dynamic>? userMetadata;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    initializeUser();
  }

  Future<void> initializeUser() async {
    try {
      final currentUser = _supabase.auth.currentUser;
      User? user = currentUser;
      userMetadata = user?.userMetadata;
    } finally {
      isLoading = false;
      update();
    }
  }

  /// Signs the user out of the application.
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

  /// Navigates to the given route using GetX's `Get.toNamed` method.
  void navigateToScreen(String route) {
    Get.toNamed(route);
  }
}
