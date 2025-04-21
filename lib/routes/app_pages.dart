import 'package:application/utils/import.dart';

class RouteGet {
  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),

    GetPage(name: AppRoutes.LOGIN_SCREEN, page: () => LoginScreen()),
    GetPage(name: AppRoutes.REGISTER_SCREEN, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.FORGOT_PASSWORD, page: () => ForgotPasswordScreen()),
    GetPage(name: AppRoutes.UPDATE_PASSWORD, page: () => UpdatePasswordScreen()),
    GetPage(name: AppRoutes.ONBOARDING_SCREEN, page: () => OnboardingScreen()),

    GetPage(name: AppRoutes.MAIN_SCREEN, page: () => MainScreen()),

    GetPage(name: AppRoutes.HOME_SCREEN, page: () => HomeScreen()),
    GetPage(name: AppRoutes.FAVORITE_SCREEN, page: () => FavoriteScreen()),
    GetPage(name: AppRoutes.CART_SCREEN, page: () => CartScreen()),
    GetPage(
      name: AppRoutes.NOTIFICATION_SCREEN,
      page: () => NotificationScreen(),
    ),
    GetPage(name: AppRoutes.PROFILE_SCREEN, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.EDIT_PROFILE_SCREEN, page: () => EditProfileScreen()),
    GetPage(
      name: AppRoutes.MANAGER_ADDRESSES_SCREEN,
      page: () => ManageAddressesScreen(),
    ),
    GetPage(name: AppRoutes.ADD_ADDRESSES_SCREEN, page: () => AddAddressScreen()),
    GetPage(name: AppRoutes.SETTINGS_SCREEN, page: () => SettingsScreen()),
  ];
}
