import 'package:application/constants/import.dart';

class ProfileController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _main = ProfileMainController();

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  final Rx<UserMetadata> _metadata = UserMetadata().obs;
  UserMetadata get metadata => _metadata.value;

  @override
  void onInit() {
    super.onInit();
    initializeUser();
  }

  Future<void> initializeUser() async {
    try {
      _isLoading.value = true;
      final user = _supabase.auth.currentUser;
      if (user == null || user.userMetadata == null) return;
      _metadata.value = UserMetadata.fromJson(user.userMetadata ?? {});
    } finally {
      _isLoading.value = false;
    }
  }

  /// Signs the user out of the application.
  Future<void> signOut() async {
    // Prompt the user to confirm sign out
    bool shouldSignOut = await _main.shouldSignOut();
    if (!shouldSignOut) return;
    try {
      await _supabase.auth.signOut();
      Get.offAllNamed(Routes.SIGN_IN_SCREEN);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  /// Navigates to the given route using GetX's `Get.toNamed` method.
  void navigateToScreen(String route) {
    Get.toNamed(route);
  }
}
