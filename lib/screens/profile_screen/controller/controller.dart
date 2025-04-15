import 'package:application/utils/import.dart';

class ProfileController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _main = ProfileMainController();
  User? user;
  RxBool isLoading = false.obs;

  Future<void> signOut() async {
    try {
      bool result = await _main.signOut();
      if (!result) return;
      isLoading(true);
      await _supabase.auth.signOut();
      Get.offAllNamed(AppRoutes.loginScreen);
    } catch (e) {
      debugPrint('Error during sign out: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() {
    debugPrint('initialize');
    user = _supabase.auth.currentUser;
    update();
  }


  void navigateToScreen(String route) {
    Get.toNamed(route);
  }
}
