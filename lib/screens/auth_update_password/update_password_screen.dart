import 'package:application/utils/import.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final _ = Get.put(UpdatePasswordController());
  final _formKey = GlobalKey<FormState>();
  final _email = Get.arguments as String;
  final _verificationCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CustomText(
                  AppConstants.UPDATE_PASSWORD,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  AppConstants.UPDATE_PASSWORD_DESC,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Obx(
              () => Form(
                key: _formKey,
                child: Column(
                  children: [
                    PinCodeFields(
                      length: 6,
                      fieldBorderStyle: FieldBorderStyle.leftRight,
                      responsive: false,
                      fieldHeight: 50.0,
                      fieldWidth: 40.0,
                      borderWidth: 0,
                      activeBorderColor: Colors.grey.shade200,
                      activeBackgroundColor: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6.0),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      autoHideKeyboard: false,
                      fieldBackgroundColor: Colors.grey.shade200,
                      borderColor: Colors.black12,
                      textStyle: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                      controller: _verificationCodeController,
                      onComplete: (String value) {},
                    ),

                    // const SizedBox(height: 16.0),
                    // const SizedBox(height: 16.0),
                    // Directionality(
                    //   textDirection: TextDirection.ltr,
                    //   child: PinCodeFields(
                    //     length: 6,
                    //     fieldBorderStyle: FieldBorderStyle.square,
                    //     responsive: false,
                    //     fieldHeight: 50.0,
                    //     fieldWidth: 40.0,
                    //     borderWidth: 0,
                    //     activeBorderColor: Colors.grey.shade200,
                    //     activeBackgroundColor: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(6.0),
                    //     keyboardType: TextInputType.number,
                    //     inputFormatters: [
                    //       FilteringTextInputFormatter.digitsOnly,
                    //     ],
                    //     autoHideKeyboard: false,
                    //     fieldBackgroundColor: Colors.grey.shade200,
                    //     borderColor: Colors.black12,
                    //     textStyle: TextStyle(
                    //       fontFamily: AppConstants.fontFamily,
                    //       fontSize: 14.0,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //     controller: _verificationCodeController,
                    //     onComplete: (String value) {},
                    //   ),
                    // ),

                    // const SizedBox(height: 16.0),
                    CustomTextField(
                      label: AppConstants.PASSWORD.tr,
                      hintText: AppConstants.EXAMPLE_PASSWORD,
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
                      label: AppConstants.CONFIRM_PASSWORD.tr,
                      hintText: AppConstants.EXAMPLE_PASSWORD,
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
                      isLoading: _.isLoading.value,
                      width: double.infinity,
                      buttonColor: AppColors.primaryColor,
                      progressColor: Colors.white,
                      onPressed: _.updatePassword,
                      child: CustomText(
                        AppConstants.UPDATE.tr,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
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
