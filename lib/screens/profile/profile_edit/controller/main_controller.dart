import 'package:application/utils/import.dart';

class EditProfileMainController {
  final supabase = Supabase.instance.client;
  final GetStorage _storage = GetStorage();

  Future<String?> openImageSource(bool isDelete) async {
    return await custombottomSheet<String?>(
      children: [
        CustomPageTitle(
          title: 'Select Image',
          subtitle: 'Choose Profile Image Source',
          padding: EdgeInsets.only(bottom: 30.0),
        ),

        CustomButton(
          backgroundColor: AppColors.grey,
          onPressed: () => Get.back(result: 'camera'),
          child: Row(
            children: [
              CustomText('Camera'),
              const Spacer(),
              SvgPicture.asset(AppAssets.camera),
            ],
          ),
        ),
        SizedBox(height: 16),

        CustomButton(
          backgroundColor: AppColors.grey,
          onPressed: () => Get.back(result: 'gallery'),
          child: Row(
            children: [
              CustomText('Gallery'),
              const Spacer(),
              SvgPicture.asset(AppAssets.gallery),
            ],
          ),
        ),
        SizedBox(height: isDelete ? 16 : 0),

        isDelete
            ? CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: 'delete'),
              child: Row(
                children: [
                  CustomText('Delete'),
                  const Spacer(),
                  SvgPicture.asset(AppAssets.trashBin),
                ],
              ),
            )
            : Container(),
      ],
    );
  }

  /// Retrieves the locale setting for the DateTimePicker.
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

  Future<String?> openGenderBottomSheet(String? value) async {
    return await custombottomSheet<String?>(
      children: [
        CustomPageTitle(
          title: 'Gender',
          subtitle: 'Select your gender',
          padding: EdgeInsets.only(bottom: 30.0),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'Male'),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              value == 'Male' ? Colors.grey.shade200 : Colors.white,
            ),
          ),
          child: Row(children: [CustomText('Male')]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'Female'),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              value == 'Female' ? Colors.grey.shade200 : Colors.white,
            ),
          ),
          child: Row(children: [CustomText('Female')]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'Not Specified'),
          style: TextButton.styleFrom(
            backgroundColor:
                value == 'Not Specified' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText('Not Specified')]),
        ),
      ],
    );
  }

  /// Opens a bottom sheet with a date picker and a confirm button.
  Future<DateTime?> openDateOfBirth({String? initialDate}) {
    final completer = Completer<DateTime>();
    DateTime? selectedDate;

    custombottomSheet(
      children: [
        CustomPageTitle(
          title: 'Date of Birth',
          subtitle: 'Choose Your Date of Birth',
        ),

        Directionality(
          textDirection: TextDirection.ltr,
          child: DatePickerWidget(
            locale: _getLocale(),
            looping: false,
            firstDate: DateTime(1920),
            lastDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
            initialDate:
                initialDate != null
                    ? DateTime.tryParse(initialDate)
                    : DateTime.now(),
            dateFormat: ConstantsText.DateBirthFormat,
            pickerTheme: DateTimePickerTheme(),
            onChange: (date, _) => selectedDate = date,
          ),
        ),
        CustomButton(
          backgroundColor: AppColors.grey,
          width: double.infinity,
          onPressed: () {
            if (selectedDate != null) {
              completer.complete(selectedDate);
            }
            Get.back();
          },
          child: CustomText('Confirm'),
        ),
      ],
    );
    return completer.future;
  }
}
