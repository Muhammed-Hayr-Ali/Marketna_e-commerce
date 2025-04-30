import 'package:application/utils/import.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _ = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _.login(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Screen Title
            Column(
              children: [
                CustomText(
                  ConstantsText.LOGIN,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16.0),
                CustomText(
                  ConstantsText.WELCOME_BACK,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            SizedBox(height: 48),

            /// Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    label: ConstantsText.EMAIL.tr,
                    hintText: ConstantsText.EXAMPLE_EMAIL,
                    controller: _emailController,
                    validator: (value) => Validators.email(value!),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    label: ConstantsText.PASSWORD.tr,
                    hintText: ConstantsText.EXAMPLE_PASSWORD,
                    controller: _passwordController,
                    validator: (value) => Validators.passwordOnly(value!),
                    isPasswordField: true,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        onPressed:
                            () => _.navigateToScreen(Routes.FORGOT_PASSWORD),
                        child: CustomText(
                          ConstantsText.FORGOT_PASSWORD,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48.0),

            /// Login Button
            CustomButton(
              isLoading: _.isLoading,
              width: double.infinity,
              buttonColor: AppColors.primaryColor,
              progressColor: Colors.white,
              onPressed: _login,
              child: CustomText(ConstantsText.LOGIN, color: AppColors.white),
            ),
            const SizedBox(height: 48.0),

            /// Others
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(ConstantsText.DONT_HAVE_ACCOUNT, fontSize: 12),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed:
                          () => _.navigateToScreen(Routes.REGISTER_SCREEN),
                      child: CustomText(
                        ConstantsText.SIGN_UP,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                CustomText(
                  ConstantsText.OR,
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
                const SizedBox(height: 12.0),
                CustomText(
                  ConstantsText.SIGN_IN_WITH,
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
                const SizedBox(height: 28.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Login with github
                    CustomCicularButton(
                      size: 42,
                      isLoading: _.isLoadingGitHub,
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
                      size: 42,
                      isLoading: _.isLoadingGoogle,
                      onPressed: _.signInWithGoogle,
                      child: SvgPicture.asset(
                        AppAssets.google,
                        height: 16,
                        width: 16,
                      ),
                    ),
                    const SizedBox(width: 16.0),

                    /// Login with x
                    CustomCicularButton(
                      size: 42,
                      isLoading: _.isLoadingX,
                      onPressed: _.signInWithX,
                      child: SvgPicture.asset(
                        AppAssets.x,
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
