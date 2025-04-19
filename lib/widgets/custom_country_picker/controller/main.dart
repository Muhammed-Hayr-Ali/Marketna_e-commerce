import 'package:application/utils/import.dart';
import 'package:application/widgets/custom_country_picker/controller/controller.dart';

class CountryPickerMainController {
  void openCountry(CountryPickerController controller) async {
    if (controller.countries.isEmpty) {
      // Load countries from the database if the list is empty
      final result = await controller.loadCountries();
      if (!result) {
        CustomNotification.showSnackbar(message: 'Failed to load countries');
        return;
      }
    }
    custombottomSheet(
      title: 'select_country',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: controller.countries.length,
            itemBuilder:
                (context, index) => TextButton(
                  onPressed: () {
                    controller.updateCountry(controller.countries[index]);
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.asset(
                              controller.countries[index].flag ?? '',
                              width: 22,
                            ),
                          ),
                          const SizedBox(width: 8),
                          CustomText(
                            controller.localCode() != 'ar'
                                ? controller.countries[index].name ?? ''
                                : controller.countries[index].nameAr ??
                                    controller.countries[index].name ??
                                    '',
                          ),
                        ],
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: CustomText(
                          controller.countries[index].code ?? '',
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }

  void openProvince(CountryPickerController controller) {
    custombottomSheet(
      title: 'select_province',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: controller.provinces.length,
            itemBuilder:
                (context, index) => TextButton(
                  onPressed: () {
                    controller.updateProvince(controller.provinces[index]);
                    Get.back();
                  },
                  child: CustomText(
                    controller.localCode() != 'ar'
                        ? controller.provinces[index].name ?? ''
                        : controller.provinces[index].nameAr ??
                            controller.provinces[index].name ??
                            '',
                  ),
                ),
          ),
        ),
      ],
    );
  }

  void openCity(CountryPickerController controller) {
    custombottomSheet(
      title: 'select_city',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: controller.cities.length,
            itemBuilder:
                (context, index) => TextButton(
                  onPressed: () {
                    controller.updateCity(controller.cities[index]);
                    Get.back();
                  },
                  child: CustomText(controller.cities[index].name ?? ''),
                ),
          ),
        ),
      ],
    );
  }
}
