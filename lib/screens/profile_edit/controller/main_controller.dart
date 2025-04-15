import 'dart:async';

import 'package:application/utils/import.dart';

class EditProfileMainController {
  final supabase = Supabase.instance.client;
  final GetStorage _storage = GetStorage();

  String getAvatarUrl(Map<String, dynamic> userMetadata) {
    return userMetadata['avatar'] ??
        userMetadata['picture'] ??
        userMetadata['avatar_url'] ??
        '';
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

  String removeTextAfterAt(String input) {
    int atIndex = input.indexOf('@');
    if (atIndex != -1) {
      return input.substring(0, atIndex);
    }
    return input;
  }

  void updateProfileError(String account) {
    CustomNotification.showSnackbar(
      message:
          '${'cant_change_profile'.tr} ${account.replaceAll('twitter', 'X')} ${'account'.tr}',
    );
  }

  DateTimePickerLocale getLocale() {
    final locale = _storage.read('locale') ?? Get.deviceLocale!.languageCode;
    switch (locale) {
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

  Future<String?> openSelectImageSource() async {
    return await custombottomSheet(
      title: 'select_image_source',
      children: [
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: 'camera'),
          child: CustomText('camera', fontSize: 12),
        ),
        SizedBox(height: 16),
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: 'gallery'),
          child: CustomText('gallery', fontSize: 12),
        ),
        SizedBox(height: 16),
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: 'delete'),
          child: CustomText('delete_image', fontSize: 12),
        ),
      ],
    );
  }

  Future<String> openGenderBottomSheet(String? value) async {
    return await custombottomSheet(
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

  Future<DateTime?> openDateBirth({String? initialDate}) {
    final Completer<DateTime> completer = Completer<DateTime>();
    DateTime? selectedDate;

    custombottomSheet(
      title: 'choose_your_date_of_birth',
      children: [
        DatePickerWidget(
          firstDate: DateTime(1920),
          lastDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
          initialDate:
              initialDate != null
                  ? DateTime.tryParse(initialDate)
                  : DateTime.now(),
          dateFormat: 'yyyy-MM-dd',
          pickerTheme: DateTimePickerTheme(),
          onChange: (DateTime date, _) {
            selectedDate = date;
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            width: double.infinity,
            onPressed: () {
              if (selectedDate != null) {
                completer.complete(selectedDate!);
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
