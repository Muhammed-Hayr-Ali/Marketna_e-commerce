import 'package:application/utils/import.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainController _controller = Get.put(MainController());

  // Bottom Navigation Bar Items
  static  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.homeIcon),
      activeIcon: SvgPicture.asset(AppAssets.homeActive),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.favoriteIcon),
      activeIcon: SvgPicture.asset(AppAssets.favoriteActive),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.cartIcon),
      activeIcon: SvgPicture.asset(AppAssets.cartActive),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.notificationIcon),
      activeIcon: SvgPicture.asset(AppAssets.notificationActive),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.profileIcon),
      activeIcon: SvgPicture.asset(AppAssets.profileActive),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: AppRoutes.homeScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
      bottomNavigationBar: Obx(() {
        return SizedBox(
          height: 48.0,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: _controller.currentIndex.value,
              onTap: (index) => _controller.changePage(index),
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              backgroundColor: Colors.white,
              items: bottomNavItems,
            ),
          ),
        );
      }),
    );
  }
}
