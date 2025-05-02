import 'package:application/utils/import.dart';

enum PermissionType { location, notification }

class AuthPermissionController extends GetxController {
  Future<void> checkLocationPermission() async {
    final locationStatus = await Permission.location.request();
    if (locationStatus.isGranted) {
      Get.offAndToNamed(Routes.NOTIFICATION_PERMISSION_SCREEN);
    } else {
      _openSettings(PermissionType.location);
    }
    return;
  }

  Future<void> checkNotificationPermission() async {
    final state = await Permission.notification.request();
    if (state.isGranted) {
      Get.offAndToNamed(Routes.MAIN_SCREEN);
    } else {
      _openSettings(PermissionType.notification);
    }
    return;
  }
}

void _openSettings(PermissionType permissionType) {
  custombottomSheet(
    children: [
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: CustomText(
          textAlign: TextAlign.center,
          permissionType == PermissionType.location
              ? ConstantsText.LOCATION_PERMISSIONS_DENIED
              : permissionType == PermissionType.notification
              ? ConstantsText.NOTIFICATION_PERMISSION_Denied
              : '',
        ),
      ),
      CustomButton(
        onPressed: () {
          openAppSettings();
          Get.back();
        },
        width: double.infinity,
        child: CustomText(ConstantsText.GO_TO_SETTINGS),
      ),
      SizedBox(height: 16),
      CustomButton(
        onPressed:
            () =>
                permissionType == PermissionType.location
                    ? Get.offAllNamed(Routes.NOTIFICATION_PERMISSION_SCREEN)
                    : Get.offAllNamed(Routes.MAIN_SCREEN),
        width: double.infinity,
        child: CustomText(ConstantsText.SKIP),
      ),
    ],
  );
}
