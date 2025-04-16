import 'package:application/utils/import.dart';

class RouteGenerator {
  static GetPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.HOME_SCREEN:
        return GetPageRoute(page: () => HomeScreen());
      case AppRoutes.FAVORITE_SCREEN:
        return GetPageRoute(page: () => FavoriteScreen());
      case AppRoutes.CART_SCREEN:
        return GetPageRoute(page: () => CartScreen());
      case AppRoutes.NOTIFICATION_SCREEN:
        return GetPageRoute(page: () => NotificationScreen());
      case AppRoutes.PROFILE_SCREEN:
        return GetPageRoute(page: () => ProfileScreen());
      default:
        return null;
    }
  }
}
