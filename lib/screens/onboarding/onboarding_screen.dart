import 'package:application/utils/import.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final _ = Get.put(OnboardingController());
  final List<Widget> pages = <Widget>[
    pageBuilder(
      image: AppAssets.onBoarding_1,
      title: 'onboarding_title_1',
      subtitle: 'onboarding_sub_title_1',
    ),
    pageBuilder(
      image: AppAssets.onBoarding_2,
      title: 'onboarding_title_2',
      subtitle: 'onboarding_sub_title_2',
    ),
    pageBuilder(
      image: AppAssets.onBoarding_3,
      title: 'onboarding_title_3',
      subtitle: 'onboarding_sub_title_3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        // backButton: false,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: _.selectLanguage,
            child: CustomText('language', color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView(
                  controller: _.pageController,
                  onPageChanged: (index) => _.updateSelectedIndex(index),
                  children: pages,
                ),
              ),
              CustomCicularButton(
                isLoading: false,
                //      progressColors: [Colors.red, Colors.green, Colors.blue],
                borderColor: AppColors.grey,
                borderWidth: 3,
                loadingValue: _.loadingValue,
                onPressed: _.nextPage,
                child: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
