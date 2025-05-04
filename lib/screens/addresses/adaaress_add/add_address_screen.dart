import 'package:application/utils/import.dart';
import 'package:application/widgets/custom_country_picker.dart';
import 'package:application/widgets/phone_text_field.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});
  final _ = Get.put(AddAddressController());
  final address = Get.arguments as AddressModel?;

  @override
  Widget build(BuildContext context) {
    /// Set the initial values for the address fields if available
    if (address != null) {
      _.loadAddress(address!);
    }

    return Scaffold(
      appBar: customAppBar(
        backButton: true,
        title: address != null ? 'Edit Address' : 'Add New Address',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _.formKey,
                child: Column(
                  children: [
                    /// address name
                    CustomTextField(
                      label: 'Address Name',
                      controller: _.addressNameController,
                      validator: (value) => Validators.addressName(value!),
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// street address
                    CustomTextField(
                      label: 'Street Address',
                      controller: _.streetAddressController,
                      validator: (value) => Validators.streetAddress(value!),
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// location
                    GetBuilder<AddAddressController>(
                      builder:
                          (_) => CustomCountryPicker(
                            selectedCountry: _.selectedCountry,
                            selectedCountryCode: _.selectedCountryCode,
                            selectedCountryFlag: _.selectedCountryFlag,
                            selectedProvince: _.selectedProvince,
                            selectedCity: _.selectedCity,

                            countryErrorMessage: _.countryErrorMessage,
                            provinceErrorMessage: _.provinceErrorMessage,
                            cityErrorMessage: _.cityErrorMessage,
                            onChangedCountry:
                                (country) => _.onChangedCountry(country),
                            onChangedProvince:
                                (value) => _.onChangedProvince(value),
                            onChangedCity: (value) => _.onChangedCity(value),
                          ),
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// phone number
                    GetBuilder<AddAddressController>(
                      builder:
                          (_) => PhoneTextField(
                            enableCode: false,
                            hintPhone: '0987654321',
                            hintCode: '963',
                            labelText: 'Phone Number',
                            selectedCode: _.selectedCountryCode,
                            phoneController: _.phoneNumberController,
                            // onSelectedCode:
                            //     (countryCode) =>
                            //         _.updateCountryCode(countryCode),
                            errorMessage:
                                _.phoneErrorMessage ??
                                _.countryCodeErrorMessage,
                          ),
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// notes
                    CustomTextField(
                      lines: 5,
                      label: 'Notes',
                      controller: _.notesController,
                    ),
                  ],
                ),
              ),

              /// space
              const SizedBox(height: 48.0),

              /// save button
              Obx(
                () => CustomButton(
                  isLoading: _.isLoading.value,
                  width: double.infinity,

                  progressColor: AppColors.white,
                  onPressed: _.addAddress,
                  child: CustomText(
                    address != null ? 'Update Address' : 'Save Address',
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
