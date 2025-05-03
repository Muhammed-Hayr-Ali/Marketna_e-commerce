import 'package:application/utils/import.dart';

class OnboardingMainController {
  Future<String?> openLanguage(String? localCode) async {
    return await custombottomSheet(
      children: [
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
