import '../../../utils/import.dart';

class SignUpController extends GetxController {
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final Uri _url = Uri.parse(ConstantsText.PRIVACY_POLICY_URL);
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
    final userName = DataConverter.removeTextAfterAt(email);

    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          ConstantsText.DISPLAY_NAME: displayName,
          ConstantsText.NAME: displayName,
          ConstantsText.FULL_NAME: displayName,
          ConstantsText.USER_NAME: userName,
        },
      );

      Get.offAllNamed(Routes.MAIN_SCREEN);
    } on AuthException catch (error) {
      // Show a snackbar with the error message
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${ConstantsText.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      // Reset the loading state
      isLoading.value = false;
    }
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
    throw Exception(ConstantsText.PRIVACY_POLICY_CANNOT_BE_OPENED);
    
  }
}
