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

      bool locationPermission = await _hasLocationPermission();
      if (!locationPermission) {
        Get.offAllNamed(Routes.LOCATION_PERMISSION_SCREEN);
        return;
      }

      bool notificationPermission = await _hasNotificationPermission();
      if (!notificationPermission) {
        Get.offAllNamed(Routes.NOTIFICATION_PERMISSION_SCREEN);
        return;
      }

      Get.offAllNamed(Routes.MAIN_SCREEN);
    } on AuthException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      CustomNotification.showSnackbar(
        message: AppException.SOMETHING_WENT_WRONG.message,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> _hasLocationPermission() async {
    final status = await Permission.location.status;
    debugPrint(status.toString());
    return status.isGranted;
  }

  Future<bool> _hasNotificationPermission() async {
    final status = await Permission.notification.status;
    debugPrint(status.isGranted.toString());
    return status.isGranted;
  }

  // void _showOpenSettingsDialog() {
  //   Get.defaultDialog(
  //     title: "Enable Location",
  //     content: Text(
  //       "Location permission is permanently denied. Please enable it from app settings.",
  //     ),
  //     textConfirm: "Open Settings",
  //     textCancel: "Cancel",
  //     onConfirm: () async {
  //       await Geolocator.openAppSettings();
  //       Get.back();
  //     },
  //     onCancel: () {},
  //   );
  // }

  /// Opens the privacy policy URL in the browser.
  Future<void> openPrivacyPolicy() async {
    /// Check if the URL can be launched.
    final canLaunch = await launchUrl(_url);

    /// If the URL can be launched, launch it.
    if (canLaunch) {
      return;
    }

    /// If the URL cannot be launched, throw an exception.
    throw Exception(ConstantsText.PRIVACY_POLICY_CANNOT_BE_OPENED);
  }
}
