

import 'package:application/constants/import.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final _ = Get.put<SplashScreenController>(SplashScreenController());

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
                () =>
                    _.errorMessage == ''
                        ? Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                              strokeWidth: 1,
                            ),
                          ),
                        )
                        : Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: CustomText(
                                  _.errorMessage,
                                  fontSize: 12.0,
                                  color: AppColors.errorRed,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _.initializeApp(),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.grey.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(99),
                                ),
                              ),
                              child: CustomText(
                                'Retry',
                                fontSize: 10.0,
                                color: Colors.blueGrey,
                              ),
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
