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

  /// Signs the user up with email and password.
  ///
  /// This function will check if the form is valid and the email and password are not empty.
  /// If the form is valid, it will call the `signUp` method of the `supabase` client and
  /// navigate to the `mainScreen` route. If an error occurs, it will show a snackbar with
  /// the error message. Finally, it will set the `isLoading` to false.
  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final displayName = nameController.text.trim();
    final userName = _removeTextAfterAt(email);

    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'display_name': displayName,
          'name': displayName,
          'full_name': displayName,
          'user_name': userName,
        },
      );

      Get.offAllNamed(AppRoutes.MAIN_SCREEN);
    } on AuthException catch (error) {
      // Show a snackbar with the error message
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      // Reset the loading state
      isLoading.value = false;
    }
  }

  /// Removes the text after the '@' symbol in the given input string.
  ///
  /// This function searches for the '@' character in the input string.
  /// If found, it returns the substring from the beginning of the input
  /// up to (but not including) the '@' character. If the '@' character
  /// is not found, it returns the input string unchanged.
  ///
  /// - Parameter input: The string to process.
  /// - Returns: The substring before the '@' character, or the original
  ///   string if '@' is not present.
  String _removeTextAfterAt(String input) {
    final atIndex = input.indexOf('@');
    return atIndex == -1 ? input : input.substring(0, atIndex);
  }

  /// Opens the privacy policy URL in the browser.
  ///
  /// This function will first check if the URL can be launched.
  /// If it can, it will launch the URL in the browser. If not,
  /// it will throw an `Exception` with an error message.
  Future<void> openPrivacyPolicy() async {
    /// Check if the URL can be launched.
    final canLaunch = await launchUrl(_url);

    /// If the URL can be launched, launch it.
    if (canLaunch) {
      return;
    }

    /// If the URL cannot be launched, throw an exception.
    throw Exception('Could not launch the privacy policy URL.');
  }
}
