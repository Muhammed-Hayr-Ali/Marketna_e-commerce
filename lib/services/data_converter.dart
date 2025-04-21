import 'package:application/utils/app_constants.dart';

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

  /// Removes the text after the '@' symbol in the given input string.
  ///
  /// This function searches for the '@' character in the input string.
  /// If found, it returns the substring from the beginning of the input
  /// up to (but not including) the '@' character. If the '@' character
  /// is not found, it returns the input string unchanged.
  ///
  /// - Parameter input: The string to process.
  /// - Returns: The substring before the '@' character, or the original
  ///   string if '@' is not present.
  static String removeTextAfterAt(String input) {
    // Find the index of the '@' character in the input string
    // If '@' is not found, return the original string
    if (input.isEmpty) return input;
    if (input.length == 1) return input;
    if (input == '@') return input;
    if (input == ' ') return input;

    final atIndex = input.indexOf('@');
    return atIndex == -1 ? input : input.substring(0, atIndex);
  }

  /// Returns the file extension of the given file name if it exists, otherwise returns an empty string.
  ///
  /// The file extension is the substring after the last '.' character in the file name.
  /// If the file name does not contain a '.' character, an empty string is returned.
  ///
  static String getFileExtension(String fileName) {
    final split = fileName.split('.');
    return split.length > 1 ? '.${split.last}' : '';
  }
}
