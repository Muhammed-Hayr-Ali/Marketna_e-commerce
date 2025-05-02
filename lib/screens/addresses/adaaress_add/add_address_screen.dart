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
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const CustomText(ConstantsText.ADD_NEW_ADDRESS),
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
                      label: ConstantsText.ADDRESS_NAME.tr,
                      controller: _.addressNameController,
                      validator: (value) => Validators.saddressName(value!),
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// street address
                    CustomTextField(
                      label: ConstantsText.STREET_ADDRESS.tr,
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
                            hintPhone: ConstantsText.DEFAULT_PHONE,
                            hintCode: ConstantsText.DEFAULT_COUNTRY_CODE,
                            labelText: ConstantsText.PHONE.tr,
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
                      label: ConstantsText.NOTES.tr,
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
                    address != null
                        ? ConstantsText.UPDATE
                        : ConstantsText.ADD_NEW_ADDRESS,
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
