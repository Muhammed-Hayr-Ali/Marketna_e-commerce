import '../../../../utils/import.dart';

class SignUpController extends GetxController {
  /// Variables
  final _supabase = Supabase.instance.client;
  final Uri _url = Uri.parse(ConstantsText.PRIVACY_POLICY_URL);
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading.value = true;

    final standardizedDisplayName = name;
    final extractedUserName = DataConverter.removeTextAfterAt(email);

    try {
      await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          ConstantsText.DISPLAY_NAME: standardizedDisplayName,
          ConstantsText.USER_NAME: extractedUserName,
        },
      );

      bool locationPermission = await Permission.location.status.isGranted;
      if (!locationPermission) {
        Get.offAllNamed(Routes.LOCATION_PERMISSION_SCREEN);
        return;
      }

      bool notificationPermission =
          await Permission.notification.status.isGranted;
      if (!notificationPermission) {
        Get.offAllNamed(Routes.NOTIFICATION_PERMISSION_SCREEN);
        return;
      }

      Get.offAllNamed(Routes.MAIN_SCREEN);
    } on AuthException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      CustomNotification.showSnackbar(
        message: 'Something has gone wrong somewhere, and we will try to fix it right away.',
      );
    } finally {
      _isLoading.value = false;
    }
  }

  /// Opens the privacy policy URL in the browser.
  Future<void> openPrivacyPolicy() async {
    /// Check if the URL can be launched.
    final canLaunch = await launchUrl(_url);

    /// If the URL can be launched, launch it.
    if (canLaunch) {
      return;
    }

    /// If the URL cannot be launched, throw an exception.
    throw Exception('Privacy policy URL could not be launched.');
  }
}
