import 'package:application/utils/import.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _ = Get.put(ForgotPasswordController());

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
                  AppConstants.RESET_PASSWORD,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  AppConstants.ENTER_EMAIL_FOR_RESET,
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
                      label: AppConstants.EMAIL.tr,
                      hintText: AppConstants.EXAMPLE_EMAIL,
                      controller: _.emailController,
                      validator: (value) => Validators.email(value!),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 48.0),

                    CustomButton(
                      isLoading: _.isLoading.value,
                      width: double.infinity,
                      buttonColor: AppColors.primaryColor,
                      progressColor: Colors.white,
                      onPressed: _.resendOTP,
                      child: CustomText(
                        AppConstants.SEND.tr,
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
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
