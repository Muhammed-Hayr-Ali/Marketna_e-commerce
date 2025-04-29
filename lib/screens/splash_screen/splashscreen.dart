import 'package:application/utils/import.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final _ = Get.put<SplashScreenController>(SplashScreenController());
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
            SizedBox(height: 100),
            SvgPicture.asset(AppAssets.logo, height: 60, width: 60),
            SizedBox(
              height: 100,
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(
                      height: 52,
                      child: CustomText(
                        _.errorMessage,
                        fontSize: 12.0,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _.isLoading
                        ? Padding(
                          padding: const EdgeInsets.all(10.0),
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
                          borderRadius: 60,
                          onPressed: _.retryInitialization,
                          child: CustomText('retry'.tr, fontSize: 10),
                        ),
                  ],
                ),
              ),
            ),
            CustomText('Powered by PST', fontSize: 8, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
