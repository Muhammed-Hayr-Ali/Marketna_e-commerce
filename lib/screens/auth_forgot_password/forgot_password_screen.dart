import 'package:application/utils/import.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _ = Get.put(ForgotPasswordController());
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  Future<void> _sendOTP() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    final result = await _.sendOTP(email: _emailController.text.trim());
    if (result) {
      Get.toNamed(
        Routes.UPDATE_PASSWORD,
        arguments: _emailController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(backButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomPageTitle(
              title: ConstantsText.RESET_PASSWORD,
              subtitle: ConstantsText.ENTER_EMAIL_FOR_RESET,
              padding: EdgeInsets.symmetric(vertical: Get.width * 0.15),
            ),

            /// Form
            Form(
              key: _formKey,
              child: CustomTextField(
                label: ConstantsText.EMAIL.tr,
                hintText: ConstantsText.EXAMPLE_EMAIL,
                controller: _emailController,
                validator: (value) => Validators.email(value!),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 50.0),

            Obx(
              () => CustomButton(
                isLoading: _.isLoading,
                width: double.infinity,
                buttonColor: AppColors.primaryColor,
                progressColor: AppColors.white,
                onPressed: _sendOTP,
                child: CustomText(ConstantsText.SEND, color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
