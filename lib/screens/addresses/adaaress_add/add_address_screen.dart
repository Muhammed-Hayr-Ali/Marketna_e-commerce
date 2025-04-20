import 'package:application/utils/import.dart';
import 'package:application/widgets/custom_country_picker.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});
  final _ = Get.put(AddAddressController());
  final address = Get.arguments as Address?;

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
        title: const CustomText(AppConstants.ADD_NEW_ADDRESS),
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
                      label: AppConstants.ADDRESS_NAME.tr,
                      controller: _.addressNameController,
                      validator: (value) => Validators.saddressName(value!),
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// street address
                    CustomTextField(
                      label: AppConstants.STREET_ADDRESS.tr,
                      controller: _.streetAddressController,
                      validator: (value) => Validators.streetAddress(value!),
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// location
                    GetBuilder<AddAddressController>(
                      builder:
                          (_) => CustomCountryPicker(
                            countryPickerMode: CountryPickerMode.address,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            textDirection: TextDirection.ltr,
                            label: AppConstants.PHONENUMBER.tr,
                            hintText: AppConstants.DEFAULT_PHONE.tr,
                            controller: _.phoneNumberController,
                            validator: (value) => Validators.phone(value!),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        GetBuilder<AddAddressController>(
                          init: AddAddressController(),
                          builder:
                              (_) => CustomButton(
                                label: AppConstants.COUNTRY_CODE,
                                errorMessage: _.countryCodeErrorMessage,

                                child: CustomText(
                                  textDirection: TextDirection.ltr,
                                  _.selectedCountryCode ??
                                      AppConstants.DEFAULT_COUNTRY_CODE.tr,
                                  color:
                                      _.selectedCountryCode == null
                                          ? Colors.grey.shade400
                                          : Colors.black,
                                ),
                              ),
                        ),
                      ],
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// notes
                    CustomTextField(
                      lines: 5,
                      label: AppConstants.NOTES.tr,
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

                  buttonColor: AppColors.primaryColor,
                  progressColor: AppColors.white,
                  onPressed: _.addAddress,
                  child: CustomText(
                    address != null
                        ? AppConstants.UPDATE
                        : AppConstants.ADD_NEW_ADDRESS,
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
