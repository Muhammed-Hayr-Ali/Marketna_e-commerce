import 'package:application/utils/import.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Run app
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeController().theme,

      translations: Localization(),
      fallbackLocale: const Locale('ar'),
      locale: LocalizationController().language,
 
      getPages: RouteGet.getPages,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}
