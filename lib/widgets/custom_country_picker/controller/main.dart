import 'package:application/utils/import.dart';
import 'package:application/widgets/custom_country_picker/controller/controller.dart';

class CountryPickerMainController {

  final _supabase = Supabase.instance.client;
  final GetStorage storage = GetStorage();


  void openCountry(CountryPickerController controller) async {
    if (controller.countries.isEmpty) {
      final result = await controller.loadCountries(
        Supabase.instance.client,
        GetStorage().read('locale') ?? Get.deviceLocale!.languageCode,
      );
      if (!result) {
        Get.snackbar('Error', 'Failed to load countries');
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
                          CustomText(controller.countries[index].name ?? ''),
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
                  child: CustomText(controller.provinces[index].name ?? ''),
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


