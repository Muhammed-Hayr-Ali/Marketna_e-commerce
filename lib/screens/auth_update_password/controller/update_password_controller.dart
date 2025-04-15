import '../../../utils/import.dart';

class UpdatePasswordController extends GetxController {
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  String? email;
  String? verificationCode;
  // final verificationCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  void updatePassword() async {
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
    // التحقق من صحة النموذج
    if (!formKey.currentState!.validate()) return;

    // تغيير حالة التحميل إلى true
    isLoading.value = true;

    try {
      await supabase.auth.verifyOTP(
        email: email!,
        token: verificationCode,
        type: OtpType.recovery,
      );

      debugPrint('User verified successfully');

      await supabase.auth.updateUser(
        UserAttributes(password: passwordController.text.trim()),
      );

      await supabase.auth.signOut();

      Get.offAllNamed(AppRoutes.loginScreen);
      CustomNotification.showSnackbar(message: 'Password updated successfully');
    } on AuthException catch (error) {
      // عرض رسالة خطأ إذا حدث استثناء أثناء تسجيل الدخول
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      // ضمان تغيير حالة التحميل إلى false بغض النظر عن النتيجة
      isLoading.value = false;
    }
  }
}
