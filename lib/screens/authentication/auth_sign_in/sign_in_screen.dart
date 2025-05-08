
import 'package:application/constants/import.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _ = Get.put(SignInScreenController());
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    await _.signInWithEmailAndPassword(
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
            CustomPageTitle(
              title: 'Sign In',
              subtitle: 'Hi! Welcome Back, you\'ve been missed',
              padding: EdgeInsets.symmetric(vertical: Get.width * 0.15),
            ),

            /// Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Email',
                    hintText: 'example@email.com',
                    controller: _emailController,
                    validator: (value) => Validators.email(value!),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    label: 'Password',
                    hintText: '●●●●●●●●●',
                    controller: _passwordController,
                    validator: (value) => Validators.passwordOnly(value!),
                    isPasswordField: true,
                    keyboardType: TextInputType.text,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                        child: CustomText(
                          'Forgot Password?',
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

            const SizedBox(height: 10.0),

            /// Login Button
            Obx(
              () => CustomButton(
                isLoading: _.isLoading,
                width: double.infinity,
                backgroundColor: AppColors.primaryColor,
                progressColor: AppColors.white,
                onPressed: _login,
                child: CustomText('Sign In', color: AppColors.white),
              ),
            ),
            const SizedBox(height: 32.0),

            /// Others
            Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 1.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        color: AppColors.grey,
                      ),
                    ),
                    CustomText(
                      'Or Sign In With',
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                    Flexible(
                      child: Container(
                        height: 1.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Login with github
                      CustomCicularButton(
                        size: 48,
                        onPressed: _.signInWithGithub,
                        child: SvgPicture.asset(
                          AppAssets.github,
                          height: 22,
                          width: 22,
                        ),
                      ),
                      const SizedBox(width: 16.0),

                      /// Login with google
                      Obx(
                        () => CustomCicularButton(
                          size: 48,
                          isLoading: _.isLoadingGoogle,
                          onPressed: _.signInWithGoogle,
                          child: SvgPicture.asset(
                            AppAssets.google,
                            height: 22,
                            width: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),

                      /// Login with x
                      CustomCicularButton(
                        size: 48,
                        onPressed: _.signInWithX,
                        child: SvgPicture.asset(
                          AppAssets.x,
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText('Don\'t have an account?', fontSize: 12),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        overlayColor: Colors.transparent,
                      ),
                      onPressed: () => Get.toNamed(Routes.REGISTER_SCREEN),
                      child: CustomText(
                        'Sign Up',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
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
