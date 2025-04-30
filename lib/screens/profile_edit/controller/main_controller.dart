import 'package:application/utils/import.dart';

class EditProfileMainController {
  final supabase = Supabase.instance.client;
  final GetStorage _storage = GetStorage();

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
        _storage.read<String>(STORAGE_KEYS.LOCALE) ??
        Get.deviceLocale!.languageCode;

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
    return await custombottomSheet<String?>(
      title: ConstantsText.SELECT_IMAGE_SOURCE,
      children: [
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: ConstantsText.CAMERA),
          child: const CustomText(ConstantsText.CAMERA, fontSize: 12),
        ),
        const SizedBox(height: 16),
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: ConstantsText.GALLERY),
          child: const CustomText(ConstantsText.GALLERY, fontSize: 12),
        ),
        const SizedBox(height: 16),
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: ConstantsText.DELETE),
          child: const CustomText(ConstantsText.DELETE, fontSize: 12),
        ),
      ],
    );
  }

  Future<String> openGenderBottomSheet(String? value) async {
    return await custombottomSheet<String?>(
          title: ConstantsText.SELECT_GENDER,
          children: [
            TextButton(
              onPressed: () => Get.back(result: ConstantsText.NOT_SPECIFIED),
              style: TextButton.styleFrom(
                backgroundColor:
                    value == ConstantsText.NOT_SPECIFIED
                        ? Colors.grey.shade200
                        : Colors.white,
              ),
              child: Row(children: [CustomText(ConstantsText.NOT_SPECIFIED)]),
            ),

            TextButton(
              onPressed: () => Get.back(result: ConstantsText.MALE),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  value == ConstantsText.MALE
                      ? Colors.grey.shade200
                      : Colors.white,
                ),
              ),
              child: Row(children: [CustomText(ConstantsText.MALE)]),
            ),
            TextButton(
              onPressed: () => Get.back(result: ConstantsText.FEMALE),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  value == ConstantsText.FEMALE
                      ? Colors.grey.shade200
                      : Colors.white,
                ),
              ),
              child: Row(children: [CustomText(ConstantsText.FEMALE)]),
            ),
          ],
        ) ??
        value ??
        ConstantsText.NOT_SPECIFIED;
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
      title: ConstantsText.CHOOSE_YOUR_DATE_OF_BIRTH,
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
          dateFormat: ConstantsText.DATE_FORMAT,
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
            child: CustomText(ConstantsText.CONFIRM),
          ),
        ),
      ],
    );
    return completer.future;
  }
}
