import 'package:application/utils/import.dart';

class RouteGenerator {
  static GetPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME_SCREEN:
        return GetPageRoute(page: () => HomeScreen());
      case Routes.FAVORITE_SCREEN:
        return GetPageRoute(page: () => FavoriteScreen());
      case Routes.CART_SCREEN:
        return GetPageRoute(page: () => CartScreen());
      case Routes.NOTIFICATION_SCREEN:
        return GetPageRoute(page: () => NotificationScreen());
      case Routes.PROFILE_SCREEN:
        return GetPageRoute(page: () => ProfileScreen());
      default:
        return null;
    }
  }
}
