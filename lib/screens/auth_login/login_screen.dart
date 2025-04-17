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
                              () =>
                                  _navigateToScreen(AppRoutes.FORGOT_PASSWORD),
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
                      onTap: () => _navigateToScreen(AppRoutes.REGISTER_SCREEN),
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
                    CustomCicularButton(
                      size: 48,
                      onTap: _.signInWithGithub,
                      padding: 12,
                      color: Colors.grey.shade100,
                      child: SvgPicture.asset(AppAssets.github),
                    ),
                    const SizedBox(width: 16.0),
                    CustomCicularButton(
                      size: 48,
                      onTap: _.googleSignIn,
                      padding: 10,
                      color: Colors.grey.shade100,
                      child: SvgPicture.asset(AppAssets.google),
                    ),
                    const SizedBox(width: 16.0),
                    CustomCicularButton(
                      size: 48,
                      onTap: _.signInWithTwitter,
                      padding: 12,
                      color: Colors.grey.shade100,
                      child: SvgPicture.asset(AppAssets.twitter),
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
