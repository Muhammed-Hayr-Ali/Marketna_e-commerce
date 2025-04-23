import 'package:application/screens/product_details/product_details_screen.dart';
import 'package:application/utils/import.dart';

class RouteGet {
  static final List<GetPage> getPages = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),

    GetPage(name: Routes.LOGIN_SCREEN, page: () => LoginScreen()),
    GetPage(name: Routes.REGISTER_SCREEN, page: () => SignUpScreen()),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordScreen()),
    GetPage(name: Routes.UPDATE_PASSWORD, page: () => UpdatePasswordScreen()),
    GetPage(name: Routes.ONBOARDING_SCREEN, page: () => OnboardingScreen()),

    GetPage(name: Routes.MAIN_SCREEN, page: () => MainScreen()),

    GetPage(name: Routes.HOME_SCREEN, page: () => HomeScreen()),
    GetPage(name: Routes.FAVORITE_SCREEN, page: () => FavoriteScreen()),
    GetPage(name: Routes.CART_SCREEN, page: () => CartScreen()),
    GetPage(name: Routes.NOTIFICATION_SCREEN, page: () => NotificationScreen()),
    GetPage(name: Routes.PROFILE_SCREEN, page: () => ProfileScreen()),
    GetPage(name: Routes.EDIT_PROFILE_SCREEN, page: () => EditProfileScreen()),
    GetPage(
      name: Routes.MANAGER_ADDRESSES_SCREEN,
      page: () => ManageAddressesScreen(),
    ),
    GetPage(name: Routes.ADD_ADDRESSES_SCREEN, page: () => AddAddressScreen()),
    GetPage(name: Routes.SETTINGS_SCREEN, page: () => SettingsScreen()),
    GetPage(name: Routes.PRODUCT_DETAILS, page: () => ProductDetailsScreen()),
  ];
}
