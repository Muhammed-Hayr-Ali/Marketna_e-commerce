import 'package:application/utils/import.dart';

class SettingsMainController {
  Future<String?> openLanguage(String? localCode) async {
    return await custombottomSheet(
      children: [
        CustomPageTitle(
          title: 'Language',
          subtitle: 'Choose your preferred language',
          padding: EdgeInsets.only(bottom: 30.0),
        ),
        TextButton(
          onPressed: () => Get.back(result: 'auto'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'auto' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText('Depending on the device system')]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'ar'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'ar' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText('العربية')]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'en'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'en' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText('English')]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'de'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'de' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText('Deutsch')]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'fr'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'fr' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText('Français')]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'tr'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'tr' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText('Türkçe')]),
        ),
      ],
    );
  }
}
