import 'package:flutter/foundation.dart';

import '../../../utils/import.dart';

class LoginController extends GetxController {
  /// Variables
  final _supabase = Supabase.instance.client;
  final RxBool _isLoading = false.obs;
  final RxBool _isLoadingGoogle = false.obs;
  bool get isLoading => _isLoading.value;
  bool get isLoadingGoogle => _isLoadingGoogle.value;

  /// Signs the user in with their email and password.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading.value = true;
      await _supabase.auth.signInWithPassword(email: email, password: password);
      Get.offAllNamed(Routes.MAIN_SCREEN);
    } on AuthException catch (error) {
      _exptectError(error.message);
      debugPrint(error.message);
    } finally {
      _isLoading.value = false;
    }
  }

  /// Signs the user in with Google.
  Future<void> signInWithGoogle() async {
    try {
      _isLoadingGoogle.value = true;
      final googleSignIn = GoogleSignIn(serverClientId: KEYS.WEB_CLIENT_ID);
      final user = await googleSignIn.signIn();

      if (user == null) {
        throw AppException.GOOGLE_SIGN_IN_FAILED;
      }

      final auth = await user.authentication;

      final accessToken = auth.accessToken;
      final idToken = auth.idToken;

      if (accessToken == null || idToken == null) {
        throw AppException.MISSING_ACCESS_OR_ID_TOKEN;
      }

      final session = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (session.user == null) {
        throw AppException.USER_NOT_FOUND_SESSION;
      }

      Get.offAllNamed(Routes.MAIN_SCREEN);
    } on AppException catch (error) {
      _exptectError(error.message);
    } on AuthException catch (error) {
      _exptectError(error.message);
    } on Exception {
      _exptectError(AppException.SOMETHING_WENT_WRONG.message);
    } finally {
      _isLoadingGoogle.value = false;
    }
  }

  /// Signs the user in with X.
  Future<void> signInWithX() async {
    try {
      await _supabase.auth.signInWithOAuth(
        OAuthProvider.twitter,
        redirectTo: kIsWeb ? null : 'marketna.scheme://marketna-host',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
    } on Exception {
      _exptectError(AppException.SOMETHING_WENT_WRONG.message);
    }
  }

  /// Signs the user in with GitHub.
  Future<void> signInWithGithub() async {
    try {
      await _supabase.auth.signInWithOAuth(
        OAuthProvider.github,
        redirectTo: kIsWeb ? null : 'marketna.scheme://marketna-host',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
    } on Exception {
      _exptectError(AppException.SOMETHING_WENT_WRONG.message);
    }
  }

  void _exptectError(dynamic error) =>
      CustomNotification.showSnackbar(message: error.toString());
}
