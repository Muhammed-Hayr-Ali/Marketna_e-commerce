import 'package:application/utils/import.dart';

class ProfileController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _main = ProfileMainController();

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  final Rx<UserMetaDataModel> _metadata = UserMetaDataModel().obs;
  UserMetaDataModel get metadata => _metadata.value;

  @override
  void onInit() {
    super.onInit();
    initializeUser();
  }

  Future<void> initializeUser() async {
    try {
      _isLoading.value = true;
      final currentUser = _supabase.auth.currentUser;
      User? user = currentUser;

      if (user == null || user.userMetadata == null) return;
      _metadata.value = UserMetaDataModel.fromJson(user.userMetadata ?? {});
      _metadata.value.email = user.email ?? '';
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
