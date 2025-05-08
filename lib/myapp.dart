
import 'package:application/constants/import.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /// Builds the main widget for the application.
  ///
  /// This widget uses [GetMaterialApp] to setup the application with internationalization,
  /// themes, and routes. It initializes the application with a splash screen and supports
  /// both light and dark themes.
  Widget build(BuildContext context) {
    // Run app
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,

      // Theme configuration
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeController().theme,

      // Localization configuration
      translations: Localization(),
      fallbackLocale: const Locale('ar'),
      locale: LocalizationController().language,

      // Route configuration
      getPages: RouteGet.getPages,
      initialRoute: Routes.SPLASH_SCREEN,
    );
  }
}
