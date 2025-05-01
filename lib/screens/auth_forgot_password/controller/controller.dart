import '../../../utils/import.dart';

class ForgotPasswordController extends GetxController {
  /// Variables
  final supabase = Supabase.instance.client;
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  /// Sends an OTP to the given email address.

  Future<bool> sendOTP({required String email}) async {
    try {
      _isLoading.value = true;
      await supabase.auth.resetPasswordForEmail(email);
      return true;
    } on AuthException catch (error) {
      String errorMessagre = error.message;

      if (error.message.contains('unexpected_failure')) {
        errorMessagre = AppException.UNABLE_TO_SEND_PASSWORD_RESET_CODE.message;
      }

      if (error.message.contains('after') &&
          error.message.contains('seconds')) {
        errorMessagre = translateDynamicMessage(error.message);
      }

      CustomNotification.showSnackbar(message: errorMessagre);
      return false;
    } on Exception {
      CustomNotification.showSnackbar(
        message: AppException.SOMETHING_WENT_WRONG.message,
      );
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  String translateDynamicMessage(String originalMessage) {
    final regex = RegExp(r'\d+');
    final match = regex.firstMatch(originalMessage);
    final seconds = int.tryParse(match?.group(0) ?? '60') ?? 60;

    return 'security_message'.trArgs([seconds.toString()]);
  }
}
