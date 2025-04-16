import '../../../utils/import.dart';

class ForgotPasswordController extends GetxController {
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  RxBool isLoading = false.obs;

  /// Resends the OTP to the given email
  ///
  /// This function will check if the form is valid and the email is not empty.
  /// If the form is valid, it will call the `resetPasswordForEmail` method of the
  /// `supabase` client and navigate to the `update_password` route with the
  /// email as an argument.
  ///
  /// If an error occurs, it will show a snackbar with the error message.
  ///
  /// Finally, it will set the `isLoading` to false.
  Future<void> resendOTP() async {
    // Check if the form is valid
    if (!formKey.currentState!.validate()) return;

    // Set the loading state to true
    isLoading.value = true;

    try {
      // Reset password for the given email
      await supabase.auth.resetPasswordForEmail(emailController.text.trim());
      // Navigate to the update password route
      Get.toNamed(
        AppRoutes.updatePassword,
        arguments: {'email': emailController.text},
      );
    } on AuthException catch (error) {
      // Show a snackbar with the error message
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      // Handle other errors and show a snackbar with the error message
      CustomNotification.showSnackbar(message: '${'An error occurred:'.tr} $error');
      debugPrint(error.toString());
    } finally {
      // Set the loading state to false
      isLoading.value = false;
    }
  }
}
