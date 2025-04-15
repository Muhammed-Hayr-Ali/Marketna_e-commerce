import 'package:application/utils/import.dart';

class RouteGenerator {
  static GetPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return GetPageRoute(page: () => HomeScreen());
      case AppRoutes.favoriteScreen:
        return GetPageRoute(page: () => FavoriteScreen());
      case AppRoutes.cartScreen:
        return GetPageRoute(page: () => CartScreen());
      case AppRoutes.notificationScreen:
        return GetPageRoute(page: () => NotificationScreen());
      case AppRoutes.profileScreen:
        return GetPageRoute(page: () => ProfileScreen());
      default:
        return null;
    }
  }
}
