
import 'package:application/constants/import.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _ = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    await _.signUp(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Title
              CustomPageTitle(
                title: 'Create New Account',
                subtitle: 'Fill your details to continue',
                padding: EdgeInsets.only(bottom: Get.width * 0.15),
              ),

              /// Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Full Name',
                      hintText: 'John Doe',
                      controller: _nameController,
                      validator: (value) => Validators.name(value!),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16.0),
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
                      label: 'Confirm Password',
                      hintText: '●●●●●●●●●',
                      controller: _confirmPasswordController,
                      validator:
                          (value) => Validators.confirmPassword(
                            value!,
                            _passwordController.text,
                          ),
                      isPasswordField: true,
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),

              /// Terms
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check, color: Colors.white, size: 12),
                  ),
                  const SizedBox(width: 2),
                  CustomText('I agree to the', fontSize: 10),
                  const SizedBox(width: 2),
                  GestureDetector(
                    onTap: _.openPrivacyPolicy,
                    child: CustomText(
                      'Terms of Use',
                      fontSize: 10,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  CustomText(' and ', fontSize: 10),
                  GestureDetector(
                    onTap: _.openPrivacyPolicy,
                    child: CustomText(
                      'Privacy Policy',
                      fontSize: 10,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

              /// Button
              const SizedBox(height: 50.0),
              Obx(
                () => CustomButton(
                  isLoading: _.isLoading,
                  width: double.infinity,
                  progressColor: Colors.white,
                  onPressed: _signUp,
                  child: CustomText('Sign Up', color: AppColors.white),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
