import '../../../utils/import.dart';

class ForgotPasswordController extends GetxController {
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  RxBool isLoading = false.obs;

  void resendAnOTP() async {
    // التحقق من صحة النموذج
    if (!formKey.currentState!.validate()) return;

    // تغيير حالة التحميل إلى true
    isLoading.value = true;

    try {
      await supabase.auth.resetPasswordForEmail(emailController.text.trim());
      Get.toNamed(
        AppRoutes.updatePassword,
        arguments: {'email': emailController.text},
      );
    } on AuthException catch (error) {
      // عرض رسالة خطأ إذا حدث استثناء أثناء تسجيل الدخول
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      // ضمان تغيير حالة التحميل إلى false بغض النظر عن النتيجة
      isLoading.value = false;
    }
  }
}
