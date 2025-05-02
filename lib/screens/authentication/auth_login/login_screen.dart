import 'package:application/utils/import.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _ = Get.put(LoginController());
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Screen Title
              CustomPageTitle(
                title: ConstantsText.LOGIN,
                subtitle: ConstantsText.WELCOME_BACK,
                padding: EdgeInsets.symmetric(vertical: Get.width * 0.15),
              ),

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
                    Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                          ),
                          onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
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

              const SizedBox(height: 10.0),

              /// Login Button
              Obx(
                () => CustomButton(
                  isLoading: _.isLoading,
                  width: double.infinity,
                  backgroundColor: AppColors.primaryColor,
                  progressColor: AppColors.white,
                  onPressed: _login,
                  child: CustomText(
                    ConstantsText.LOGIN,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              /// Others
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(ConstantsText.DONT_HAVE_ACCOUNT, fontSize: 12),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          overlayColor: Colors.transparent,
                        ),
                        onPressed: () => Get.toNamed(Routes.REGISTER_SCREEN),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
