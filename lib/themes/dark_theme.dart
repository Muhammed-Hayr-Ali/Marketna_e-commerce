import 'package:application/constants/import.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: AppStrings.fontFamily,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontFamily: AppStrings.fontFamily,
      fontWeight: FontWeight.w400,
    ),
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  ),
inputDecorationTheme: inputDecorationTheme,
);
