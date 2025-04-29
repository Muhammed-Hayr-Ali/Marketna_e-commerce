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
          child: Row(children: [CustomText(ConstantsText.ARABIC)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'en'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'en' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText(ConstantsText.ENGLISH)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'de'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'de' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText(ConstantsText.GERMAN)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'fr'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'fr' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText(ConstantsText.FRENCH)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: 'tr'),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == 'tr' ? Colors.grey.shade200 : Colors.white,
          ),
          child: Row(children: [CustomText(ConstantsText.TURKISH)]),
        ),
      ],
    );
  }
}
