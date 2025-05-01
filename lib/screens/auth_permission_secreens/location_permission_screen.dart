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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Get.width * 0.5,
                width: Get.width * 0.5,
                padding: EdgeInsets.all(Get.width * 0.1),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: SvgPicture.asset(
                  AppAssets.mapPoint,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              CustomPageTitle(
                title: 'What is Your Location?',
                subtitle:
                    'we need your location\nto give you the best experience',
              ),
              const SizedBox(height: 24),
              CustomButton(
                borderRadius: 999,
                onPressed: _navigateToNextScreen,
                buttonColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomText(
                  'Allow Location Access',
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                borderRadius: 999,
                onPressed: () => Get.offAllNamed(Routes.MAIN_SCREEN),
                buttonColor: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomText('Skip', color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ), //Center(child: CustomText('LocationPermissionScreen'))),
    );
  }
}
