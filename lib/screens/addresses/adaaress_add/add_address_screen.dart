import 'package:application/utils/import.dart';
import 'package:application/widgets/custom_country_picker.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});
  final _ = Get.put(AddAddressController());
  final country = Get.arguments as Map<String, dynamic>?;

  @override
  Widget build(BuildContext context) {
    /// Set the initial values for the address fields if available
    if (country != null) {
      _.addressNameController.text = country!['addressName'] ?? '';
      _.streetAddressController.text = country!['streetAddress'] ?? '';

      _.phoneNumberController.text = country!['phoneNumber'] ?? '';
      _.notesController.text = country!['notes'] ?? '';

      /// Set the initial values for the country fields if available

      /// Set the initial values for the country code if available
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
                    CustomCountryPicker(
                      countryPickerMode: CountryPickerMode.address,
                      initCountryCode: country?['code'],

                      onChangedCountry: ({code, flag, name}) {
                        _.country = name;
                        _.flag = flag;
                        _.updateCountryCode(code); // Update the country code
                      },

                      onChangedProvince: (value) => _.province = value,
                      onChangedCity: (value) => _.city = value,
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// phone number
                    Row(
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
                        CustomButton(
                          label: '',
                          child: GetBuilder<AddAddressController>(
                            init: AddAddressController(),
                            builder:
                                (_) => CustomText(
                                  textDirection: TextDirection.ltr,
                                  _.countryCode ??
                                      AppConstants.DEFAULT_COUNTRY_CODE,
                                  color:
                                      _.countryCode == null
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
                  child: CustomText(color: AppColors.white, AppConstants.SAVE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
