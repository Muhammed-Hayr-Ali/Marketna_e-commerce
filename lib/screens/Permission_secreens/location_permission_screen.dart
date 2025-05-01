import 'package:application/utils/import.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  Future<bool> _hasNotificationPermission() async {
    final status = await Permission.notification.status;
    debugPrint(status.isGranted.toString());
    return status.isGranted;
  }

  Future<void> _navigateToNextScreen() async {
    bool notificationPermission = await _hasNotificationPermission();
    if (!notificationPermission) {
      Get.offAllNamed(Routes.NOTIFICATION_PERMISSION_SCREEN);
      return;
    }
    Get.offAllNamed(Routes.MAIN_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      body: Center(
        child: Column(
          children: [
            CustomText('Location Permission Screen'),
            TextButton(
              onPressed: _navigateToNextScreen,
              child: CustomText('Go To Notification Permission Screen'),
            ),
          ],
        ),
      ), //Center(child: CustomText('LocationPermissionScreen'))),
    );
  }
}
