import 'package:flutter/foundation.dart';

import '../../../utils/import.dart';

class LoginController extends GetxController {
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool loginWithIsLoading = false.obs;

  /// Signs the user in with an email and password.
  ///
  /// This function will check if the form is valid and the email and password are not empty.
  /// If the form is valid, it will call the `signInWithPassword` method of the `supabase` client
  /// and navigate to the `mainScreen` route. If an error occurs, it will show a snackbar with
  /// the error message. Finally, it will set the `isLoading` to false.
  Future<void> login() async {
    // Check if the form is valid
    if (!formKey.currentState!.validate()) return;

    // Set loading state
    isLoading.value = true;

    // Get email and password from controllers
    // Trim whitespace from email and password
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Attempt to sign in with Supabase using email and password
    // If successful, navigate to main screen
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      Get.offAllNamed(AppRoutes.MAIN_SCREEN);
    } on AuthException catch (error) {
      // Show error message in a snackbar
      CustomNotification.showSnackbar(message: error.message);
      debugPrint(error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${AppConstants.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      // Reset loading state
      isLoading.value = false;
    }
  }

  /// Signs the user in with Google.
  ///
  /// This function initiates a Google Sign-In flow, retrieves the access and ID tokens,
  /// and uses them to authenticate with the Supabase backend. If successful, it navigates
  /// to the main screen. If an error occurs, a snackbar with the error message is displayed.
  Future<void> googleSignIn() async {
    // Set loading state
    loginWithIsLoading.value = true;
    try {
      // Initialize GoogleSignIn with the server client ID
      final googleSignIn = GoogleSignIn(serverClientId: KEYS.WEB_CLIENT_ID);

      // Attempt to sign in the user
      final user = await googleSignIn.signIn();
      final authentication = await user!.authentication;

      // Retrieve access and ID tokens
      final accessToken = authentication.accessToken;
      final idToken = authentication.idToken;

      // Ensure tokens are not null
      if (accessToken == null || idToken == null) {
        throw AppConstants.GOOGLE_SIGN_IN_FAILED;
      }

      // Sign in with Supabase using OAuth provider and tokens
      final AuthResponse authResponse = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      // Check if the session is null
      if (authResponse.session == null) {
        throw AppConstants.GOOGLE_SIGN_IN_FAILED;
      }
      // Navigate to main screen
      Get.offAllNamed(AppRoutes.MAIN_SCREEN);
    } on AuthApiException catch (error) {
      // Show error message in a snackbar
      CustomNotification.showSnackbar(message: error.message);
      debugPrint(error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${AppConstants.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      // Reset loading state
      loginWithIsLoading.value = false;
    }
  }

  /// Signs the user in with Twitter.
  ///
  /// This function initiates a Twitter OAuth flow, and uses the authorization code
  /// to authenticate with the Supabase backend. If successful, it navigates to the
  /// main screen. If an error occurs, a snackbar with the error message is displayed.
  ///
  /// The `signInWithOAuth` method will return a session if the user is found and the
  /// password is correct. If the user is not found or the password is incorrect, it
  /// will throw an `AuthException` with a message indicating the error.
  ///
  /// The `mainScreen` route is a route that displays the main screen of the app.
  Future<void> signInWithTwitter() async {
    // Set loading state
    loginWithIsLoading.value = true;

    // Attempt to sign in with Supabase using Twitter OAuth
    // If successful, navigate to main screen
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.twitter,
        redirectTo: kIsWeb ? null : 'marketna.scheme://marketna-host',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
    } on AuthException catch (error) {
      /// Show error message in a snackbar
      CustomNotification.showSnackbar(message: error.message);
      debugPrint(error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${AppConstants.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      // Reset loading state
      loginWithIsLoading.value = false;
    }
  }

  /// Signs the user in with GitHub.
  ///
  /// This function initiates a GitHub OAuth flow, and uses the authorization code
  /// to authenticate with the Supabase backend. If successful, it navigates to the
  /// main screen. If an error occurs, a snackbar with the error message is displayed.
  Future<void> signInWithGithub() async {
    // Set loading state
    loginWithIsLoading.value = true;

    // Attempt to sign in with Supabase using GitHub OAuth
    // If successful, navigate to main screen
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.github,
        redirectTo: kIsWeb ? null : 'marketna.scheme://marketna-host',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
    } on AuthException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
      debugPrint(error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${AppConstants.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      loginWithIsLoading.value = false;
    }
  }
}
