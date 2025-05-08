import 'package:application/constants/import.dart';

class EditProfileMainController {
  final supabase = Supabase.instance.client;
  final GetStorage _storage = GetStorage();

  Future<String?> openImageSource(bool isDelete) async {
    return await custombottomSheet<String?>(
      children: [
        CustomPageTitle(
          title: AppStrings.selectImage,
          subtitle: AppStrings.selectImageSubTitle,
          padding: EdgeInsets.only(bottom: 30.0),
        ),

        CustomButton(
          backgroundColor: AppColors.grey,
          onPressed: () => Get.back(result: FieldValues.camera),
          child: Row(
            children: [
              CustomText(AppStrings.camera),
              const Spacer(),
              SvgPicture.asset(AppAssets.camera),
            ],
          ),
        ),
        SizedBox(height: 16),

        CustomButton(
          backgroundColor: AppColors.grey,
          onPressed: () => Get.back(result: FieldValues.gallery),
          child: Row(
            children: [
              CustomText(AppStrings.gallery),
              const Spacer(),
              SvgPicture.asset(AppAssets.gallery),
            ],
          ),
        ),
        SizedBox(height: isDelete ? 16 : 0),

        isDelete
            ? CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: FieldValues.delete),
              child: Row(
                children: [
                  CustomText(AppStrings.delete),
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
        _storage.read<String>(StorageKeys.localeCode) ??
        Get.deviceLocale!.languageCode;

    switch (localeCode) {
      case FieldValues.ar:
        return DateTimePickerLocale.ar;
      case FieldValues.en:
        return DateTimePickerLocale.en_us;
      case FieldValues.fr:
        return DateTimePickerLocale.fr;
      case FieldValues.de:
        return DateTimePickerLocale.de;
      case FieldValues.tr:
        return DateTimePickerLocale.tr;
      default:
        return DateTimePickerLocale.en_us;
    }
  }

  Future<String?> openGenderBottomSheet(String? value) async {
    return await custombottomSheet<String?>(
      children: [
        CustomPageTitle(
          title: AppStrings.gender,
          subtitle: AppStrings.genderSubTitle,
          padding: EdgeInsets.only(bottom: 30.0),
        ),

        TextButton(
          onPressed: () => Get.back(result: FieldValues.male),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              value == FieldValues.male ? Colors.grey.shade200 : Colors.white,
            ),
          ),
          child: Row(children: [CustomText(AppStrings.male)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: FieldValues.female),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              value == FieldValues.female ? Colors.grey.shade200 : Colors.white,
            ),
          ),
          child: Row(children: [CustomText(AppStrings.female)]),
        ),

        TextButton(
          onPressed: () => Get.back(result:FieldValues.notSpecified),
          style: TextButton.styleFrom(
            backgroundColor:
                value == FieldValues.notSpecified ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText(AppStrings.notSpecified)]),
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
          title: AppStrings.dateOfBirth,
          subtitle: AppStrings.dateOfBirthSubTitle,
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
            dateFormat: AppStrings.dateFormat,
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
          child: CustomText(AppStrings.confirm),
        ),
      ],
    );
    return completer.future;
  }
}
