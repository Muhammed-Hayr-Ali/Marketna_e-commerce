import '../../../utils/import.dart';

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
          ConstantsText.NAME: standardizedDisplayName,
          ConstantsText.FULL_NAME: standardizedDisplayName,
          ConstantsText.USER_NAME: extractedUserName,
        },
      );

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


  void checkLocationPermission() async {
    final hasPermission = await hasLocationPermission();
    debugPrint(hasPermission.toString());
  }

Future<bool> hasLocationPermission() async {
  LocationPermission permission;

  try {
    permission = await Geolocator.checkPermission();
  } on Exception catch (_) {
    return false;
  }
  return permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse;
}

// Future<bool> hasLocationPermission() async {
//     LocationPermission permission;

//     try {
//       permission = await Geolocator.checkPermission();
//     } on Exception catch (_) {
//       return false;
//     }

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         _showPermissionDeniedDialog();
//         return false;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       _showOpenSettingsDialog();
//       return false;
//     }

//     return permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse;
//   }

  // وظيفة لإظهار رسالة عندما يرفض المستخدم الإذن
  void _showPermissionDeniedDialog() {
    Get.defaultDialog(
      title: "Location Permission Denied",
      content: Text("Location access is required to provide accurate results."),
      textConfirm: "OK",
      onConfirm: Get.back,
    );
  }

  // وظيفة لتوجيه المستخدم إلى إعدادات التطبيق
  void _showOpenSettingsDialog() {
    Get.defaultDialog(
      title: "Enable Location",
      content: Text(
        "Location permission is permanently denied. Please enable it from app settings.",
      ),
      textConfirm: "Open Settings",
      textCancel: "Cancel",
      onConfirm: () async {
        await Geolocator.openAppSettings();
        Get.back();
      },
      onCancel: () {},
    );
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
    throw Exception(ConstantsText.PRIVACY_POLICY_CANNOT_BE_OPENED);
  }
}
