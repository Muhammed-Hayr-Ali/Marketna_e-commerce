import 'package:application/utils/import.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _ = Get.put(SignUpController());

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
                  ConstantsText.CREATE_ACCOUNT,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  ConstantsText.FILL_YOUR_DETAILS,
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
                    CustomTextField(
                      label: ConstantsText.FULL_NAME.tr,
                      hintText: ConstantsText.DEFAULT_NAME,
                      controller: _.nameController,
                      validator: (value) => Validators.name(value!),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      label: ConstantsText.EMAIL.tr,
                      hintText: ConstantsText.EXAMPLE_EMAIL,
                      controller: _.emailController,
                      validator: (value) => Validators.email(value!),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      label: ConstantsText.PASSWORD.tr,
                      hintText: ConstantsText.EXAMPLE_PASSWORD,
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
                      label: ConstantsText.CONFIRM_PASSWORD.tr,
                      hintText: ConstantsText.EXAMPLE_PASSWORD,
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
                      onPressed: _.signUp,
                      child: CustomText(
                        ConstantsText.SIGN_UP,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check, color: Colors.white, size: 12),
                ),
                const SizedBox(width: 2),
                CustomText(ConstantsText.AGREE_TO_TERMS, fontSize: 10),
                const SizedBox(width: 2),
                GestureDetector(
                  onTap: _.openPrivacyPolicy,
                  child: CustomText(
                    ConstantsText.PRIVACY_POLICY,
                    fontSize: 10,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
