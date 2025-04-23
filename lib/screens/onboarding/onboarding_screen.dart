import 'package:application/utils/import.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingScreen> {



  int initPage = 0;
  int selectedPage = 0;

  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
    keepPage: true,
  );

  void _next() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _auth() async {
    Get.offAllNamed(Routes.LOGIN_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    selectedPage = value;
                  });
                },
                children: [
                  pageBuilder(
                    image: AppAssets.onBoarding_1,
                    title: AppConstants.ONBOARDING_TITLE_1,
                    subtitle:AppConstants.ONBOARDING_SUBTITLE_1
,
                  ),
                  pageBuilder(
                    image: AppAssets.onBoarding_2,
                    title: AppConstants.ONBOARDING_TITLE_2,
                    subtitle: AppConstants.ONBOARDING_SUBTITLE_2
                  ),
                  pageBuilder(
                    image: AppAssets.onBoarding_3,
                    title: AppConstants.ONBOARDING_TITLE_3,
                    subtitle: AppConstants.ONBOARDING_SUBTITLE_3
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Indicator(selected: selectedPage, length: 3),
                  const SizedBox(height: 20),
                  CustomButton(
                    width: double.infinity,
                    onPressed: selectedPage == 2 ? _auth : _next,
                    child: CustomText(selectedPage == 2 ? AppConstants.LOGIN : AppConstants.NEXT),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
