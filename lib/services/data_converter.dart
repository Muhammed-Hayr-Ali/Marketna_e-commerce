import 'package:application/utils/constants.dart';

class DataConverter {
  /// Retrieves the avatar URL from the user's metadata.
  ///
  /// This function attempts to obtain the avatar URL by checking several keys
  /// in the provided [userMetadata] map. It checks the keys in the following order:
  /// 'AVATAR', 'AVATAR_URL', and 'PICTURE'. The first non-null value found is returned.
  /// If none of these keys have a value, the function returns null.
  ///
  /// [userMetadata] A map containing user metadata as returned by the Supabase client.
  /// [returns] The avatar URL or null if no URL is available.

  static String getAvatarUrl(Map<String, dynamic> userMetadata) =>
      userMetadata[AppConstants.AVATAR] ??
      userMetadata[AppConstants.AVATAR_URL] ??
      userMetadata[AppConstants.PICTURE] ??
      '';

  /// Retrieves the user's name from the metadata.
  ///
  /// This function attempts to obtain the user's name by checking several keys
  /// in the provided [userMetadata] map. It checks the keys in the following order:
  /// 'display_name', 'name', 'full_name', 'user_name', and 'preferred_username'.
  /// The first non-null value found is returned. If none of these keys have a value,
  /// the function returns null.
  ///
  /// [userMetadata] A map containing user metadata as returned by the Supabase client.
  /// [returns] The user's name or null if no name is available.

  static String getUserName(Map<String, dynamic> userMetadata) =>
      userMetadata[AppConstants.DISPLAY_NAME] ??
      userMetadata[AppConstants.NAME] ??
      userMetadata[AppConstants.FULL_NAME] ??
      userMetadata[AppConstants.USER_NAME] ??
      userMetadata[AppConstants.PREFERRED_USERNAME] ??
      '';
}
