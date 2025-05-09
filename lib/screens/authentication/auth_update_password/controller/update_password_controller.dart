import 'package:application/constants/import.dart';

class UpdatePasswordController extends GetxController {
  /// Variables
  final _supabase = Supabase.instance.client;
  final RxBool _isLoading = false.obs;
  final RxString _verificationCodeErrorMessage = ''.obs;
  bool get isLoading => _isLoading.value;
  String get verificationCodeErrorMessage =>
      _verificationCodeErrorMessage.value;

  bool isVerificationCodeValid(String verificationCode) {
    if (verificationCode.isEmpty) {
      _verificationCodeErrorMessage.value =
          ValidatorMessage.verificationCodeEmptyErrorMessage;
      return false;
    } else if (verificationCode.length != 6) {
      _verificationCodeErrorMessage.value =
          ValidatorMessage.verificationCodeLengthErrorMessage;
      return false;
    }
    _verificationCodeErrorMessage.value = '';
    return true;
  }

  Future<void> updatePassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    try {
      _isLoading.value = true;

      // Verify the OTP
      await _supabase.auth.verifyOTP(
        email: email,
        token: verificationCode,
        type: OtpType.recovery,
      );

      // Update the user's password
      await _supabase.auth.updateUser(UserAttributes(password: newPassword));

      // Log the user out
      await _supabase.auth.signOut();

      // Navigate to the login screen
      Get.offAllNamed(Routes.SIGN_IN_SCREEN);

      // Show a success message
      CustomNotification.showSnackbar(
        message: NotificationMessage.passwordUpdatedSuccess,
      );
    } on AuthException catch (error) {
      // Show an error message
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      // Reset the loading state
      _isLoading.value = false;
    }
  }
}
