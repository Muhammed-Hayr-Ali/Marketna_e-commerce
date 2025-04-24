import 'package:application/utils/import.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _ = Get.put(LoginController());

  void _navigateToScreen(String route) {
    Get.toNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CustomText(
                  AppConstants.LOGIN,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  AppConstants.WELCOME_BACK,
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
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      label: AppConstants.PASSWORD.tr,
                      hintText: AppConstants.EXAMPLE_PASSWORD,
                      controller: _.passwordController,
                      validator: (value) => Validators.passwordOnly(value!),
                      isPasswordField: true,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        GestureDetector(
                          onTap:
                              () => _navigateToScreen(Routes.FORGOT_PASSWORD),
                          child: CustomText(
                            AppConstants.FORGOT_PASSWORD,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 48.0),

                    CustomButton(
                      isLoading: _.isLoading.value,
                      width: double.infinity,
                      buttonColor: AppColors.primaryColor,
                      progressColor: Colors.white,
                      onPressed: _.login,
                      child: CustomText(
                        AppConstants.LOGIN,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(AppConstants.DONT_HAVE_ACCOUNT, fontSize: 12),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => _navigateToScreen(Routes.REGISTER_SCREEN),
                      child: CustomText(
                        AppConstants.SIGN_UP,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                CustomText(AppConstants.OR, color: Colors.grey, fontSize: 10.0),
                const SizedBox(height: 12.0),
                CustomText(
                  AppConstants.SIGN_IN_WITH,
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
                const SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Login with github
                    CustomCicularButton(
                      size: 16,
                      onPressed: _.signInWithGithub,
                      child: SvgPicture.asset(
                        AppAssets.github,
                        height: 16,
                        width: 16,
                      ),
                    ),
                    const SizedBox(width: 16.0),

                    /// Login with google
                    CustomCicularButton(
                      size: 16,
                      onPressed: _.googleSignIn,
                      child: SvgPicture.asset(
                        AppAssets.google,
                        height: 16,
                        width: 16,
                      ),
                    ),
                    const SizedBox(width: 16.0),

                    /// Login with x
                    CustomCicularButton(
                      size: 16,
                      onPressed: _.signInWithTwitter,
                      child: SvgPicture.asset(
                        AppAssets.twitter,
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ],
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
