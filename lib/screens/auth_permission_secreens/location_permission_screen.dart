import 'package:application/utils/import.dart';

class LocationPermissionScreen extends StatelessWidget {
  LocationPermissionScreen({super.key});

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
                  AppAssets.mapPoint,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              CustomPageTitle(
                title: ConstantsText.WHAT_IS_YOUR_LOCATION,
                subtitle: ConstantsText.WHAT_IS_YOUR_LOCATION_DESC,
              ),
              const SizedBox(height: 24),
              CustomButton(
                borderRadius: 999,
                onPressed: _.checkLocationPermission,
                // buttonColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomText(
                  ConstantsText.ALLOW_LOCATION_ACCESS,
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
