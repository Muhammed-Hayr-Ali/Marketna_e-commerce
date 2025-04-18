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
    return Obx(() {
      if (_controller.isLoading && _controller.countries.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return countryPickerMode == CountryPickerMode.code
          ? _pickerCodeMode(_controller)
          : _pickerAddressMode(_controller);
    });
  }

  Widget _pickerCodeMode(CountryPickerController controller) {
    return CustomButton(
      label: codeLabel ?? '',
      isLoading: controller.isLoading,
      onPressed: () => _mainController.openCountry(controller),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Transform.translate(
          offset: const Offset(-1, 1),
          child:
              controller.selectedCountry != null
                  ?
                   CustomText(
                    controller.selectedCountry!.code!,
                    fontWeight: FontWeight.w500,
                  )
                  :
                   initCountryCode != null
                  ?
                   CustomText(initCountryCode!, fontWeight: FontWeight.w500)
                  :
                  CustomText(
                    '+963',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
        ),
      ),
    );
  }

  Widget _pickerAddressMode(CountryPickerController controller) {
    return Column(
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
                          CustomText(controller.selectedCountry!.name ?? ''),
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
    );
  }
}
