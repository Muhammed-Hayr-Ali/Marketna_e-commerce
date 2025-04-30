import 'package:application/utils/import.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final _ =  Get.put<SplashScreenController>(SplashScreenController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
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
                        color: AppColors.red,
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
                          height: 40,
                          borderRadius: 60,
                          onPressed: _.retryInitialization,
                          child: CustomText(ConstantsText.RETRY, fontSize: 10),
                        ),
                  ],
                ),
              ),
            ),
            CustomText(
              ConstantsText.POWERED_BY_PST,
              fontSize: 8,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
