import 'package:application/constants/import.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// Screen Title
            Column(
              children: [
                CustomPageTitle(
                  title: AppStrings.forgotPassword,
                  subtitle: AppStrings.forgotPasswordSubTitle,
                  padding: EdgeInsets.symmetric(vertical: Get.width * 0.15),
                ),

                /// Form
                Form(
                  key: _formKey,
                  child: CustomTextField(
                    label: AppStrings.email,
                    hintText: AppStrings.emailHint,
                    controller: _emailController,
                    validator: (value) => Validators.email(value!),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(height: 50.0),

                /// Button
                Obx(
                  () => CustomButton(
                    isLoading: _.isLoading,
                    width: double.infinity,
                    progressColor: AppColors.white,
                    onPressed: _sendOTP,
                    child: CustomText(
                      AppStrings.sendResetCode,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(),
          ],
        ),
      ),
    );
  }
}
