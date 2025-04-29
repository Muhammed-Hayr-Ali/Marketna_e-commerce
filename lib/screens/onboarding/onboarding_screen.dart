import 'package:application/utils/import.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final _ = Get.put(OnboardingController());
  final List<Widget> pages = <Widget>[
    pageBuilder(
      image: AppAssets.onBoarding_1,
      title: ConstantsText.ONBOARDING_TITLE_1,
      subtitle: ConstantsText.ONBOARDING_SUBTITLE_1,
    ),
    pageBuilder(
      image: AppAssets.onBoarding_2,
      title: ConstantsText.ONBOARDING_TITLE_2,
      subtitle: ConstantsText.ONBOARDING_SUBTITLE_2,
    ),
    pageBuilder(
      image: AppAssets.onBoarding_3,
      title: ConstantsText.ONBOARDING_TITLE_3,
      subtitle: ConstantsText.ONBOARDING_SUBTITLE_3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 64),
              Expanded(
                child: PageView(
                  controller: _.pageController,
                  onPageChanged: (index) => _.changeSelectedIndex(index),
                  children: pages,
                ),
              ),
              CustomCicularButton(
                //   progressMultiColors: [Colors.orange, Colors.green, Colors.blue],
                borderColor: Colors.grey.shade200,
                borderWidth: 2,
                loadingValue: _.loadingValue,
                onPressed: _.nextPage,
                child: Icon(Icons.arrow_back, size: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
