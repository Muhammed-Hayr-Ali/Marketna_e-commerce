import 'package:application/utils/import.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<String> pages = [
    AppRoutes.HOME_SCREEN,
    AppRoutes.FAVORITE_SCREEN,
    AppRoutes.CART_SCREEN,
    AppRoutes.NOTIFICATION_SCREEN,
    AppRoutes.PROFILE_SCREEN,
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }
}
