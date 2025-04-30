// ignore_for_file: constant_identifier_names

class AppException implements Exception {
  final String message;
  const AppException(this.message);

  static const NO_INTERNET_CONNECTION = AppException('no_internet_connection');
  static const CONNECTION_TIME_OUT = AppException('connection_time_out');
  static const SOMETHING_WENT_WRONG = AppException('something_went_wrong');
  static const INVALID_LOGIN_CREDENTIALS = AppException(
    'Invalid login credentials',
  );
  static const GOOGLE_SIGN_IN_FAILED = AppException('google_sign_in_failed');
  static const MISSING_ACCESS_OR_ID_TOKEN = AppException(
    'Missing_access_or_ID_token',
  );
  static const USER_NOT_FOUND_SESSION = AppException(
    'User_not_found_in_session',
  );

  


  @override
  String toString() => 'AppException: $message';
}
