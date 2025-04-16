import '../../../utils/import.dart';

class UpdatePasswordController extends GetxController {
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  String? email;
  String? verificationCode;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  /// Updates the user's password.
  ///
  /// This function verifies the user's email and verification code, and then
  /// updates the user's password. If the verification code is invalid, or if the
  /// password is empty, it will show an error message. If the password is updated
  /// successfully, it will log the user out and navigate to the login screen.
  ///
  /// The user's email and verification code are passed as parameters to this
  /// function. The verification code is a 6-digit code that is sent to the user's
  /// email.
  ///
  /// The user's password is updated using the `updateUser` method of the
  /// `supabase` client. The `updateUser` method takes a `UserAttributes` object
  /// as a parameter, which contains the new password.
  ///
  /// If an error occurs while updating the user's password, it will show an error
  /// message.
  ///
  /// Finally, the user is logged out using the `signOut` method of the `supabase`
  /// client, and then navigated to the login screen.
  Future<void> updatePassword() async {
    if (verificationCode == null) {
      CustomNotification.showSnackbar(
        message: 'verification_code_cannot_be_empty',
      );
      return;
    } else if (verificationCode!.length != 6) {
      CustomNotification.showSnackbar(
        message: 'verification_code_invalid_length',
      );
      return;
    }

    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      // Verify the user's email and verification code
      await supabase.auth.verifyOTP(
        email: email!,
        token: verificationCode!,
        type: OtpType.recovery,
      );

      // Update the user's password
      await supabase.auth.updateUser(
        UserAttributes(password: passwordController.text.trim()),
      );

      // Log the user out
      await supabase.auth.signOut();

      // Navigate to the login screen
      Get.offAllNamed(AppRoutes.loginScreen);

      // Show a success message
      CustomNotification.showSnackbar(
        message: 'password_updated_successfully',
      );
    } on AuthException catch (error) {
      // Show an error message
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      // Reset the loading state
      isLoading.value = false;
    }
  }
}
