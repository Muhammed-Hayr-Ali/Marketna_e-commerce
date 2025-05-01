import 'package:application/utils/import.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  Future<void> _navigateToNextScreen() async {
    Get.offAllNamed(Routes.HOME_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      body: Center(
        child: Column(
          children: [
            CustomText('Location Permission Screen'),
            TextButton(
              onPressed: _navigateToNextScreen,
              child: CustomText('Go To Home Screen'),
            ),
          ],
        ),
      ), //Center(child: CustomText('LocationPermissionScreen'))),
    );
  }
}
