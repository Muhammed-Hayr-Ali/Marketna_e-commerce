import '../../../utils/import.dart';

class UpdatePasswordController extends GetxController {
  final supabase = Supabase.instance.client;

  ////////////////
  final formKey = GlobalKey<FormState>();

  /////////////////////
  final RxBool _isLoading = false.obs;
  final RxString _verificationCodeErrorMessage = ''.obs;

  bool get isLoading => _isLoading.value;
  String get verificationCodeErrorMessage =>
      _verificationCodeErrorMessage.value;

  bool chekCodeIsValid(String code) {
    if (code.isEmpty) {
      _verificationCodeErrorMessage.value =
          ConstantsText.VERIFICATION_CODE_CANNOT_BE_EMPTY;
      return false;
    } else if (code.length != 6) {
      _verificationCodeErrorMessage.value =
          ConstantsText.VERIFICATION_CODE_INVALID_LENGTH;
      return false;
    }
    _verificationCodeErrorMessage.value = '';
    return true;
  }

  Future<void> updatePassword({
    required String? email,
    required String? verificationCode,
    required String password,
  }) async {
    try {
      _isLoading.value = true;

      // Verify the user's email and verification code
      await supabase.auth.verifyOTP(
        email: email!,
        token: verificationCode!,
        type: OtpType.recovery,
      );

      // Update the user's password
      await supabase.auth.updateUser(UserAttributes(password: password));

      // Log the user out
      await supabase.auth.signOut();

      // Navigate to the login screen
      Get.offAllNamed(Routes.LOGIN_SCREEN);

      // Show a success message
      CustomNotification.showSnackbar(
        message: ConstantsText.PASSWORD_UPDATED_SUCCESSFULLY,
      );
    } on AuthException catch (error) {
      // Show an error message
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${ConstantsText.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      // Reset the loading state
      _isLoading.value = false;
    }
  }
}
