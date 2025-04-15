import 'package:application/utils/import.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingScreen> {

  final String title_1 = 'Purchase Online';
  final String title_2 = 'Track order';
  final String title_3 = 'Get your order';
  final String subtitle_1 =
      'Enjoy a unique and easy shopping experience in our application';
  final String subtitle_2 = 'Track shipments real-time';
  final String subtitle_3 =
      'Enjoy your favorite products with confidence and safety';

  final String next = 'Next';
  final String login = 'Login';

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
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                  title: title_1,
                  subtitle: subtitle_1,
                ),
                pageBuilder(
                  image: AppAssets.onBoarding_2,
                  title: title_2,
                  subtitle: subtitle_2,
                ),
                pageBuilder(
                  image: AppAssets.onBoarding_3,
                  title: title_3,
                  subtitle: subtitle_3,
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
                  onPressed: selectedPage == 2 ? _auth : _next,
                  child: CustomText(selectedPage == 2 ? login : next),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
