import 'package:application/constants/import.dart';

class SettingsMainController {
  Future<String?> openLanguage(String? localCode) async {
    return await custombottomSheet(
      children: [
        CustomPageTitle(
          title: AppStrings.language,
          subtitle: AppStrings.languageSubTitle,
          padding: EdgeInsets.only(bottom: 30.0),
        ),
        TextButton(
          onPressed: () => Get.back(result: FieldValues.auto),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == FieldValues.auto
                    ? Colors.grey.shade200
                    : Colors.white,
          ),
          child: Row(
            children: [CustomText(AppStrings.dependingOnTheDeviceSystem)],
          ),
        ),

        TextButton(
          onPressed: () => Get.back(result: FieldValues.ar),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == FieldValues.ar
                    ? Colors.grey.shade200
                    : Colors.white,
          ),
          child: Row(children: [CustomText(AppStrings.arabic)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: FieldValues.en),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == FieldValues.en
                    ? Colors.grey.shade200
                    : Colors.white,
          ),
          child: Row(children: [CustomText(AppStrings.english)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: FieldValues.de),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == FieldValues.de
                    ? Colors.grey.shade200
                    : Colors.white,
          ),
          child: Row(children: [CustomText(AppStrings.german)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: FieldValues.fr),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == FieldValues.fr
                    ? Colors.grey.shade200
                    : Colors.white,
          ),
          child: Row(children: [CustomText(AppStrings.francis)]),
        ),

        TextButton(
          onPressed: () => Get.back(result: FieldValues.tr),
          style: TextButton.styleFrom(
            backgroundColor:
                localCode == FieldValues.tr
                    ? Colors.grey.shade200
                    : Colors.white,
          ),
          child: Row(children: [CustomText(AppStrings.turkish)]),
        ),
      ],
    );
  }
}
