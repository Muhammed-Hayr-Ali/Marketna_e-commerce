import 'package:application/constants/import.dart';

class SignInScreenController extends GetxController {
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
      final googleSignIn = GoogleSignIn(serverClientId: AppKeys.webClientId);
      final user = await googleSignIn.signIn();

      if (user == null) {
        throw AppException('Google sign in failed');
      }

      final auth = await user.authentication;

      final accessToken = auth.accessToken;
      final idToken = auth.idToken;

      if (accessToken == null || idToken == null) {
        throw AppException('Missing access or ID token');
      }

      final session = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (session.user == null) {
        throw AppException('User Not Found In Session');
      }

      Get.offAllNamed(Routes.MAIN_SCREEN);
    } on AppException catch (error) {
      _exptectError(error.message);
    } on AuthException catch (error) {
      _exptectError(error.message);
    } on Exception {
      _exptectError('Something has gone wrong somewhere, and we will try to fix it right away.');
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
      _exptectError('Something has gone wrong somewhere, and we will try to fix it right away.');
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
      _exptectError('Something has gone wrong somewhere, and we will try to fix it right away.');
    }
  }

  void _exptectError(dynamic error) =>
      CustomNotification.showSnackbar(message: error.toString());
}
