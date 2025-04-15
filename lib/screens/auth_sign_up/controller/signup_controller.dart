import '../../../utils/import.dart';

class SignUpController extends GetxController {
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final Uri _url = Uri.parse(AppConstants.privacypolicy);
  RxBool isLoading = false.obs;

  void signUp() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    try {
      await supabase.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        data: {
          'display_name': nameController.text.trim(),
          'name': nameController.text.trim(),
          'full_name': nameController.text.trim(),
          'user_name': _removeTextAfterAt(emailController.text.trim()),
        },
      );

      Get.offAllNamed(AppRoutes.mainScreen);
    } on AuthException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
      debugPrint(error.message);
    } finally {
      isLoading.value = false;
    }
  }

  /// delete text after @
  String _removeTextAfterAt(String input) {
    int atIndex = input.indexOf('@');
    if (atIndex != -1) {
      return input.substring(0, atIndex);
    }
    return input;
  }

  Future<void> openPrivacyPolicy() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
