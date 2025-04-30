import 'package:application/utils/import.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: AppConstants.fontFamily,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontFamily: AppConstants.fontFamily,
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
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      fontFamily: AppConstants.fontFamily,
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      overlayColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  ),
);
