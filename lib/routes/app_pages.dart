import 'package:application/utils/import.dart';

class RouteGet {
  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),

    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
    GetPage(name: AppRoutes.registerScreen, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: AppRoutes.updatePassword, page: () => UpdatePasswordScreen()),
    GetPage(name: AppRoutes.onboardingScreen, page: () => OnboardingScreen()),

    GetPage(name: AppRoutes.mainScreen, page: () => MainScreen()),

    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),
    GetPage(name: AppRoutes.favoriteScreen, page: () => FavoriteScreen()),
    GetPage(name: AppRoutes.cartScreen, page: () => CartScreen()),
    GetPage(
      name: AppRoutes.notificationScreen,
      page: () => NotificationScreen(),
    ),
    GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.editProfileScreen, page: () => EditProfileScreen()),
    GetPage(
      name: AppRoutes.manageAddressesScreen,
      page: () => ManageAddressesScreen(),
    ),
    GetPage(name: AppRoutes.addAddressesScreen, page: () => AddAddressScreen()),
  ];
}
