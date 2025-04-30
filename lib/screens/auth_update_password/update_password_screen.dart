import 'package:application/utils/import.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final _ = Get.put(UpdatePasswordController());
  final _formKey = GlobalKey<FormState>();
  final _email = Get.arguments as String;
  final _verificationCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _updatePassword() async {
    final codeIsValid = _.chekCodeIsValid(
      _verificationCodeController.text.trim(),
    );
    final isValid = _formKey.currentState!.validate();
    if (!codeIsValid || !isValid) return;
    await _.updatePassword(
      email: _email,
      verificationCode: _verificationCodeController.text.trim(),
      password: _passwordController.text.trim(),
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
              title: ConstantsText.UPDATE_PASSWORD,
              subtitle: ConstantsText.UPDATE_PASSWORD_DESC,
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
                      // fieldWidth: 40.0,
                      borderWidth: 1.0,
                      activeBorderColor: Colors.blueGrey,
                      fieldBackgroundColor: Colors.grey.shade200,
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
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                            : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    label: ConstantsText.PASSWORD.tr,
                    hintText: ConstantsText.EXAMPLE_PASSWORD,
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
                    label: ConstantsText.CONFIRM_PASSWORD.tr,
                    hintText: ConstantsText.EXAMPLE_PASSWORD,
                    controller: _confirmPasswordController,
                    validator:
                        (value) => Validators.confirmPassword(
                          value!,
                          _passwordController.text,
                        ),
                    isPasswordField: true,
                    keyboardType: TextInputType.text,
                  ),

                  const SizedBox(height: 48.0),

                  CustomButton(
                    isLoading: _.isLoading,
                    width: double.infinity,
                    buttonColor: AppColors.primaryColor,
                    progressColor: Colors.white,
                    onPressed: _updatePassword,
                    child: CustomText(
                      ConstantsText.UPDATE.tr,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
