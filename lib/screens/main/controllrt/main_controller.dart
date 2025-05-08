import 'package:application/constants/import.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<String> pages = [
    Routes.HOME_SCREEN,
    Routes.FAVORITE_SCREEN,
    Routes.CART_SCREEN,
    Routes.NOTIFICATION_SCREEN,
    Routes.PROFILE_SCREEN,
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }
}
