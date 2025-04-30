import 'package:flutter/foundation.dart';

import '../../../utils/import.dart';

class LoginController extends GetxController {
  final _supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final RxBool _isLoadingGitHub = false.obs;
  bool get isLoadingGitHub => _isLoadingGitHub.value;

  final RxBool _isLoadingGoogle = false.obs;
  bool get isLoadingGoogle => _isLoadingGoogle.value;

  final RxBool _isLoadingX = false.obs;
  bool get isLoadingX => _isLoadingX.value;

  /// Logs the user in with their email and password.
  ///
  /// This function will first validate the form and retrieve the user's email and
  /// password. If the form is valid, it will attempt to log the user in using the
  /// `signInWithPassword` method of the `supabase` client. If successful, it will
  /// navigate to the main screen. If an error occurs, it will show an error message
  /// in a snackbar.
  Future<void> login() async {
    // Set loading state
    _isLoading.value = true;

    // Retrieve the user's email and password
    if (!formKey.currentState!.validate()) return;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      // Attempt to log the user in
      await _supabase.auth.signInWithPassword(email: email, password: password);
      // Navigate to the main screen
      Get.offAllNamed(Routes.MAIN_SCREEN);
    } on AuthException catch (error) {
      // Handle authentication errors
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      // Reset loading state to false
      _isLoading.value = false;
    }
  }

  /// Signs the user in with their Google account using the Google Sign-In SDK for Flutter.
  //
  /// This function first initializes the Google Sign-In SDK with the server client ID.
  /// It then attempts to sign in the user, and if successful, retrieves the access and
  /// ID tokens from the `GoogleAuthentication` object. It then signs in the user with
  /// Supabase using the `signInWithIdToken` method of the `supabase.auth` client,
  /// passing the OAuth provider, access token, and ID token. If the sign in is successful,
  /// it navigates to the main screen. If an error occurs, it shows an error message in a
  /// snackbar. Finally, it resets the loading state to false.
  Future<void> signInWithGoogle() async {
    // Set loading state
    _isLoadingGoogle.value = true;
    try {
      // Initialize GoogleSignIn with the server client ID
      final googleSignIn = GoogleSignIn(serverClientId: KEYS.WEB_CLIENT_ID);

      // Attempt to sign in the user
      final googleUser = await googleSignIn.signIn();
      final googleAuthentication = await googleUser!.authentication;

      // Retrieve access and ID tokens
      final accessToken = googleAuthentication.accessToken;
      final idToken = googleAuthentication.idToken;

      // Ensure tokens are not null
      if (accessToken == null || idToken == null) {
        throw AppConstants.GOOGLE_SIGN_IN_FAILED;
      }

      // Sign in with Supabase using OAuth provider and tokens
      final session = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      // Check if the session is null
      if (session.user == null) {
        throw AppConstants.GOOGLE_SIGN_IN_FAILED;
      }
      // Navigate to main screen
      Get.offAllNamed(Routes.MAIN_SCREEN);
    } catch (error) {
      // Show error message in a snackbar
      CustomNotification.showSnackbar(message: error.toString());
      debugPrint(error.toString());
    } finally {
      // Reset loading state
      _isLoadingGoogle.value = false;
    }
  }

  /// Signs the user in with Twitter.
  ///
  /// This function initiates a Twitter OAuth flow, and uses the authorization code
  /// to authenticate with the Supabase backend. If successful, it navigates to the
  /// main screen. If an error occurs, a snackbar with the error message is displayed.
  Future<void> signInWithX() async {
    // Set loading state
    _isLoadingX.value = true;

    try {
      // Attempt to sign in with Supabase using Twitter OAuth
      await _supabase.auth.signInWithOAuth(
        OAuthProvider.twitter,
        redirectTo: kIsWeb ? null : 'marketna.scheme://marketna-host',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
    } on AuthException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
    } finally {
      // Reset loading state
      _isLoadingX.value = false;
    }
  }

  /// Signs the user in with GitHub.
  ///
  /// This function initiates a GitHub OAuth flow, and uses the authorization code
  /// to authenticate with the Supabase backend. If successful, it navigates to the
  /// main screen. If an error occurs, a snackbar with the error message is displayed.
  Future<void> signInWithGithub() async {
    // Set loading state
    _isLoadingGitHub.value = true;

    try {
      // Attempt to sign in with Supabase using Twitter OAuth
      await _supabase.auth.signInWithOAuth(
        OAuthProvider.github,
        redirectTo: kIsWeb ? null : 'marketna.scheme://marketna-host',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
    } on AuthException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
      debugPrint(error.toString());
    } finally {
      // Reset loading state
      _isLoadingGitHub.value = false;
    }
  }

  void navigateToScreen(String route) => Get.toNamed(route);
}
