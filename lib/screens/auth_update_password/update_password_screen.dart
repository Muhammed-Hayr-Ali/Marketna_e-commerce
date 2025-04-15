import 'package:application/utils/import.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final _ = Get.put(UpdatePasswordController());
  final String email = Get.arguments['email'];

  @override
  Widget build(BuildContext context) {
    _.email = email;
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
                  'update_password',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  'update_password_desc',
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Obx(
              () => Form(
                key: _.formKey,
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeFields(
                        length: 6,
                        fieldBorderStyle: FieldBorderStyle.square,
                        responsive: false,
                        fieldHeight: 50.0,
                        fieldWidth: 40.0,
                        borderWidth: 0,
                        activeBorderColor: Colors.grey.shade200,
                        activeBackgroundColor: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6.0),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        autoHideKeyboard: false,
                        fieldBackgroundColor: Colors.grey.shade200,
                        borderColor: Colors.black12,
                        textStyle: TextStyle(
                          fontFamily: AppConstants.fontFamily,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        onComplete:
                            (String value) => _.verificationCode = value,
                      ),
                    ),

                    // CustomTextField(
                    //   label: 'verification_code'.tr,
                    //   hintText: ''.tr,
                    //   controller: _.verificationCodeController,
                    //   validator: (value) => Validators.verificationCode(value!),
                    //   keyboardType: TextInputType.phone,
                    //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                    //   maxLength: 6,
                    //   counterText: '',
                    // ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      label: 'password'.tr,
                      hintText: '●●●●●●●●●'.tr,
                      controller: _.passwordController,
                      validator:
                          (value) => Validators.password(
                            value!,
                            _.confirmPasswordController.text,
                          ),
                      isPasswordField: true,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      label: 'confirm_password'.tr,
                      hintText: '●●●●●●●●●'.tr,
                      controller: _.confirmPasswordController,
                      validator:
                          (value) => Validators.confirmPassword(
                            value!,
                            _.passwordController.text,
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
                      child: CustomText('update'.tr, color: AppColors.white),
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
