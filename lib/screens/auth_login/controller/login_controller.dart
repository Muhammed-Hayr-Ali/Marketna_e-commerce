import 'package:flutter/foundation.dart';

import '../../../utils/import.dart';

class LoginController extends GetxController {
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool loginWithIsLoading = false.obs;

  void login() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    try {
      await supabase.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAllNamed(AppRoutes.mainScreen);
    } on AuthException catch (error) {
      debugPrint(error.message);
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> googleSignIn() async {
    loginWithIsLoading.value = true;
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: Keys.WEB_CLIENT_ID,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      _updateUser();
      Get.offAllNamed(AppRoutes.mainScreen);
    } on AuthApiException catch (error) {
      debugPrint(error.message);
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      loginWithIsLoading.value = false;
    }
  }

  // Sign in with Twitter
  Future<void> signInWithTwitter() async {
    loginWithIsLoading.value = true;

    try {
      final response = await supabase.auth.signInWithOAuth(
        OAuthProvider.twitter,
        redirectTo: kIsWeb ? null : 'marketna.scheme://marketna-host',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );

      if (response) {
        _updateUser();
        debugPrint('User signed in successfully');
      }
    } on AuthException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      loginWithIsLoading.value = false;
    }
  }

  Future<void> signInWithGithub() async {
    loginWithIsLoading.value = true;
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.github,
        redirectTo: kIsWeb ? null : 'marketna.scheme://marketna-host',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
    } on AuthException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      loginWithIsLoading.value = false;
    }
  }

  Future<void> _updateUser() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    await supabase
        .from('profiles')
        .update({
          'display_name': _getUserName(user),
          'avatar':
              user.userMetadata!['picture'] ?? user.userMetadata!['avatar_url'],
        })
        .eq('id', user.id);
  }

  String _getUserName(User? user) {
    if (user == null) return '';
    return user.userMetadata!['name'] ??
        user.userMetadata!['display_name'] ??
        user.userMetadata!['full_name'] ??
        user.userMetadata!['user_name'] ??
        '';
  }
}
