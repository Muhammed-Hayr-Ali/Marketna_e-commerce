import 'package:application/utils/import.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final _ = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            SizedBox(height: 20, width: 20),
            SvgPicture.asset(AppAssets.logo, height: 60, width: 60),
            Obx(
              () =>
                  _.loading.value
                      ? Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                            strokeWidth: 1,
                          ),
                        ),
                      )
                      : CustomButton(
                        height: 40,
                        borderRadius: 60,
                        onPressed: _.retry,
                        child: CustomText('retry'.tr, fontSize: 10),
                      ),
            ),
            CustomText('Powered by PST', fontSize: 10, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
