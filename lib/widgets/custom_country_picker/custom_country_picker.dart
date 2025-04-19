import 'package:application/utils/import.dart';
import 'package:application/widgets/custom_country_picker/controller/controller.dart';
import 'package:application/widgets/custom_country_picker/controller/main.dart';

enum CountryPickerMode { address, code }

class CustomCountryPicker extends StatelessWidget {
  CustomCountryPicker({
    super.key,
    required this.countryPickerMode,
    this.onChangedCountry,
    this.onChangedProvince,
    this.onChangedCity,
    this.codeLabel,
    this.initCountryCode,
  });

  /// [countryPickerMode] is the mode of the country picker
  /// [initCountryCode] is the initial country code
  /// [codeLabel] is the label of the code picker
  /// [onChangedCountry] is the callback when country is changed
  /// [onChangedProvince] is the callback when province is changed
  /// [onChangedCity] is the callback when city is changed
  final CountryPickerMode countryPickerMode;
  final String? initCountryCode;
  final String? codeLabel;

  /// Callback when country is changed
  /// [name] is the name of the country
  /// [code] is the code of the country
  /// [flag] is the flag of the country
  /// [onChangedCountry] is the callback when country is changed
  final void Function({String? name, String? code, String? flag})?
  onChangedCountry;

  /// Callback when province is changed
  /// [name] is the name of the province
  final void Function(String)? onChangedProvince;

  /// Callback when city is changed
  /// [name] is the name of the city
  final void Function(String)? onChangedCity;

  final _controller = Get.put(CountryPickerController());
  final _mainController = CountryPickerMainController();

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    return countryPickerMode == CountryPickerMode.code
        ? _codePicker(controller)
        : _addressPicker(controller);
  }

  /// Builds a code picker widget.
  ///
  /// This widget is used to pick a country code from a list of countries.
  ///
  /// It displays a button with the label [codeLabel] or an empty string if [codeLabel] is null.
  /// The button is disabled if [controller.isLoading] is true.
  /// When the button is pressed, it opens a bottom sheet with a list of countries to pick from.
  ///
  /// The button displays the selected country code or [initCountryCode] if no country has been selected.
  /// The country code is displayed in a grey color if no country has been selected.
  /// The country code is displayed with a font weight of 500.
  Widget _codePicker(CountryPickerController controller) {
    return CustomButton(
      label: codeLabel ?? '',
      isLoading: controller.isLoading,
      onPressed: () => _mainController.openCountry(controller),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Transform.translate(
          offset: const Offset(-1, 1),
          child: Obx(
            () {
              final selectedCountry = controller.selectedCountry;
              final countryCode = selectedCountry?.code ?? initCountryCode;

              return CustomText(
                countryCode ?? '+963',
                fontWeight: FontWeight.w500,
                color: countryCode == null ? Colors.grey : null,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Builds an address picker widget.
  ///
  /// This widget is used to pick a country, province and city from a list of countries.
  ///
  /// It displays a column with three children:
  ///   - A label for the country
  ///   - A button to pick a country
  ///   - A row with two children:
  ///     - A column with two children:
  ///       - A label for the province
  ///       - A button to pick a province
  ///     - A column with two children:
  ///       - A label for the city
  ///       - A button to pick a city
  ///
  /// The buttons are disabled if [controller.isLoading] is true.
  /// When a button is pressed, it opens a bottom sheet with a list of countries to pick from.
  ///
  /// The buttons display the selected country, province and city or the default label if no item has been selected.
  /// The selected items are displayed in a grey color if no item has been selected.
  /// The selected items are displayed with a font weight of 500.
  Widget _addressPicker(CountryPickerController controller) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label for Country
          CustomText(
            'country',
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          // Country Picker
          CustomButton(
            isLoading: controller.isLoading,
            width: double.infinity,
            onPressed: () => _mainController.openCountry(controller),
            child:
                controller.selectedCountry != null
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.asset(
                                controller.selectedCountry!.flag!,
                                width: 20,
                              ),
                            ),
                            const SizedBox(width: 8),
                            CustomText(
                              controller.localCode() != 'ar'
                                  ? controller.selectedCountry!.name ?? ''
                                  : controller.selectedCountry!.nameAr ??
                                      controller.selectedCountry!.name ??
                                      '',
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText('select_country'),
                        const Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
          ),

          // Province and City Pickers
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'state/province',
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomButton(
                      width: double.infinity,
                      onPressed:
                          controller.provinces.isNotEmpty
                              ? () => _mainController.openProvince(controller)
                              : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            controller.localCode() != 'ar'
                                ? controller.selectedProvince?.name ?? ''
                                : controller.selectedProvince?.nameAr ??
                                    controller.selectedProvince?.name ??
                                    'select_province',
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'city',
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomButton(
                      width: double.infinity,
                      onPressed:
                          controller.cities.isNotEmpty
                              ? () => _mainController.openCity(controller)
                              : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            controller.selectedCity?.name ?? 'select_city',
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
