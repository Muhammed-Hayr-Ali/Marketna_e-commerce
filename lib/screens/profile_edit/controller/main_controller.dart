import 'dart:async';

import 'package:application/utils/import.dart';

class EditProfileMainController {
  final supabase = Supabase.instance.client;
  final GetStorage _storage = GetStorage();

  /// Gets the avatar URL from the user's metadata.
  ///
  /// This function takes a [Map] of user metadata and returns the value of the
  /// 'avatarUrl', 'picture', or 'avatar_url' key. If none of these keys is
  /// present, it returns an empty string.
  ///
  /// [userMetadata] A map of user metadata as returned by the Supabase client.
  /// [returns] The avatar URL or an empty string if none is present.
  String? getAvatarUrl(Map<String, dynamic> userMetadata) {
    return userMetadata['avatar'] ??
        userMetadata['avatar_url'] ??
        userMetadata['picture'];
  }

  String getUserName(User? user) {
    if (user == null) return '';
    return user.userMetadata!['display_name'] ??
        user.userMetadata!['name'] ??
        user.userMetadata!['full_name'] ??
        user.userMetadata!['user_name'] ??
        user.userMetadata!['preferred_username'] ??
        '';
  }

  /*************  ✨ Windsurf Command ⭐  *************/
  /// Returns the file extension of the given [fileName].
  ///
  /// This function takes a file name and returns its extension. If the file name
  /// does not contain a '.', it returns an empty string.
  ///
  /// [fileName] A file name.
  /// [returns] The file extension or an empty string if none is present.
  /// *****  ee203165-c947-4d1c-8a8d-5e5469f985a8  ******
  String getFileExtension(String fileName) {
    final split = fileName.split('.');
    return split.length > 1 ? '.${split.last}' : '';
  }

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
  String removeTextAfterAt(String input) {
    final atIndex = input.indexOf('@');
    return atIndex == -1 ? input : input.substring(0, atIndex);
  }

  void updateProfileError(String account) {
    CustomNotification.showSnackbar(
      message:
          '${'cant_change_profile'.tr} ${account.replaceAll('twitter', 'X')} ${'account'.tr}',
    );
  }

  /// Retrieves the locale setting for the DateTimePicker.
  ///
  /// This function reads the locale code from local storage. If no locale code
  /// is stored, it defaults to the device's language code. It then maps the
  /// locale code to a corresponding `DateTimePickerLocale` value.
  ///
  /// Supported locale codes include:
  /// - 'ar' for Arabic
  /// - 'en' for English (United States)
  /// - 'fr' for French
  /// - 'de' for German
  /// - 'tr' for Turkish
  ///
  /// If the locale code is not recognized, it defaults to English (United States).
  ///
  /// Returns a `DateTimePickerLocale` corresponding to the stored or device locale.

  DateTimePickerLocale _getLocale() {
    final String localeCode =
        _storage.read<String>('locale') ?? Get.deviceLocale!.languageCode;

    switch (localeCode) {
      case 'ar':
        return DateTimePickerLocale.ar;
      case 'en':
        return DateTimePickerLocale.en_us;
      case 'fr':
        return DateTimePickerLocale.fr;
      case 'de':
        return DateTimePickerLocale.de;
      case 'tr':
        return DateTimePickerLocale.tr;
      default:
        return DateTimePickerLocale.en_us;
    }
  }

  /// Displays a bottom sheet for selecting an image source.
  ///
  /// This function presents a bottom sheet with options to select an image
  /// from the camera, the gallery, or to delete the image. It returns a
  /// [Future] that resolves with the user's selection as a string: 'camera',
  /// 'gallery', or 'delete'.
  ///
  /// Returns a [Future<String?>] that resolves to the selected image source
  /// or null if no selection is made.

  Future<String?> openSelectImageSource() async {
    return custombottomSheet(
      title: 'select_image_source',
      children: [
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: 'camera'),
          child: const CustomText('camera', fontSize: 12),
        ),
        const SizedBox(height: 16),
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: 'gallery'),
          child: const CustomText('gallery', fontSize: 12),
        ),
        const SizedBox(height: 16),
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: 'delete'),
          child: const CustomText('delete_image', fontSize: 12),
        ),
      ],
    );
  }

  Future<String> openGenderBottomSheet(String? value) async {
    return await custombottomSheet<String?>(
          title: 'select_gender',
          children: [
            TextButton(
              onPressed: () => Get.back(result: 'not_specified'),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  value == 'not_specified'
                      ? Colors.grey.shade200
                      : Colors.white,
                ),
              ),
              child: Row(children: [CustomText('not_specified')]),
            ),
            TextButton(
              onPressed: () => Get.back(result: 'male'),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  value == 'male' ? Colors.grey.shade200 : Colors.white,
                ),
              ),
              child: Row(children: [CustomText('male')]),
            ),
            TextButton(
              onPressed: () => Get.back(result: 'female'),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  value == 'female' ? Colors.grey.shade200 : Colors.white,
                ),
              ),
              child: Row(children: [CustomText('female')]),
            ),
          ],
        ) ??
        value ??
        'not_specified';
  }

  /// Opens a bottom sheet with a date picker and a confirm button.
  ///
  /// The picker is limited to dates between 1920 and 10 years ago.
  /// The initial date is either the [initialDate] parameter or the current date.
  ///
  /// When the user selects a date and clicks the confirm button, the future
  /// returned by this function completes with the selected date.
  ///
  /// If the user cancels the bottom sheet, the future completes with null.
  ///
  /// The bottom sheet is decorated with the 'choose_your_date_of_birth' title.
  ///
  Future<DateTime?> openDateOfBirth({String? initialDate}) {
    final completer = Completer<DateTime>();
    DateTime? selectedDate;

    custombottomSheet(
      title: 'choose_your_date_of_birth',
      children: [
        DatePickerWidget(
          locale: _getLocale(),
          looping: false,
          firstDate: DateTime(1920),
          lastDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
          initialDate:
              initialDate != null
                  ? DateTime.tryParse(initialDate)
                  : DateTime.now(),
          dateFormat: 'yyyy-MM-dd',
          pickerTheme: DateTimePickerTheme(),
          onChange: (date, _) => selectedDate = date,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            width: double.infinity,
            onPressed: () {
              if (selectedDate != null) {
                completer.complete(selectedDate);
              }
              Get.back();
            },
            child: CustomText('confirm'.tr),
          ),
        ),
      ],
    );
    return completer.future;
  }
}
