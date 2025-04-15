import 'package:application/utils/import.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<String> pages = [
    AppRoutes.homeScreen,
    AppRoutes.favoriteScreen,
    AppRoutes.cartScreen,
    AppRoutes.notificationScreen,
    AppRoutes.profileScreen,
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }
}
