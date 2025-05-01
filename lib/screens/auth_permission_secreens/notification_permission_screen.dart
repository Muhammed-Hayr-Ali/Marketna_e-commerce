import 'package:application/utils/import.dart';

class NotificationPermissionScreen extends StatelessWidget {
  NotificationPermissionScreen({super.key});

  final _ = Get.put(AuthPermissionController());

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
                  AppAssets.bill,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              CustomPageTitle(
                title: ConstantsText.WHAT_IS_YOUR_NOTIFICATION,
                subtitle: ConstantsText.WHAT_IS_YOUR_NOTIFICATION_DESC,
              ),
              const SizedBox(height: 24),
              CustomButton(
                borderRadius: 999,
                onPressed: _.checkNotificationPermission,
                // buttonColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomText(
                  ConstantsText.ALLOW_NOTIFICATION_ACCESS,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ), //Center(child: CustomText('LocationPermissionScreen'))),
    );
  }
}
