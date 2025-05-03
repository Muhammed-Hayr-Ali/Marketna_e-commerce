import 'package:application/utils/import.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final _ = Get.put(UpdatePasswordController());
  final _formKey = GlobalKey<FormState>();
  final _email = Get.arguments as String?;
  final _verificationCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _updatePassword() async {
    final isVerificationCodeValid = _.isVerificationCodeValid(
      _verificationCodeController.text.trim(),
    );
    final isFormValid = _formKey.currentState!.validate();
    if (!isVerificationCodeValid || !isFormValid) return;

    if (_email == null) return;

    await _.updatePassword(
      email: _email,
      verificationCode: _verificationCodeController.text.trim(),
      newPassword: _passwordController.text.trim(),
    );
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
              title: 'Update Password',
              subtitle: 'Enter your verification code and new password',
              padding: EdgeInsets.only(bottom: Get.width * 0.15),
            ),

            /// Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeFields(
                      animation: Animations.slideInUp,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.022,
                      ),
                      length: 6,
                      fieldBorderStyle: FieldBorderStyle.square,
                      responsive: true,
                      fieldHeight: Get.width * 0.175,
                      borderWidth: 1.0,
                      activeBorderColor: Colors.blueGrey,
                      fieldBackgroundColor: AppColors.grey,
                      activeBackgroundColor: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6.0),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      autoHideKeyboard: false,
                      borderColor: Colors.black12,
                      textStyle: TextStyle(
                        fontFamily: ConstantsText.fontFamily,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                      controller: _verificationCodeController,
                      onComplete: (String value) {},
                    ),
                  ),
                  Obx(
                    () =>
                        _.verificationCodeErrorMessage != ''
                            ? FadeAnimationDy(
                              delay: 200,
                              dy: 6,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  6.0,
                                  2.0,
                                  6.0,
                                  0,
                                ),
                                child: Text(
                                  (_.verificationCodeErrorMessage).tr,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.errorRed,
                                  ),
                                ),
                              ),
                            )
                            : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    label: 'Password',
                    hintText: '●●●●●●●●●',
                    controller: _passwordController,
                    validator:
                        (value) => Validators.password(
                          value!,
                          _confirmPasswordController.text,
                        ),
                    isPasswordField: true,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    label: 'Confirm Password',
                    hintText: '●●●●●●●●●',
                    controller: _confirmPasswordController,
                    validator:
                        (value) => Validators.confirmPassword(
                          value!,
                          _passwordController.text,
                        ),
                    isPasswordField: true,
                    keyboardType: TextInputType.text,
                  ),

                  const SizedBox(height: 50.0),

                  Obx(
                    () => CustomButton(
                      isLoading: _.isLoading,
                      width: double.infinity,
                      progressColor: Colors.white,
                      onPressed: _updatePassword,
                      child: CustomText(
                        'Update Password',
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
