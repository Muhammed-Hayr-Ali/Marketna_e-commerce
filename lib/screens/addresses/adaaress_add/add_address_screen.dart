import 'package:application/utils/import.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});
  final _ = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const CustomText('add_new_address'),
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
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
                          label: 'address_name'.tr,
                          controller: _.addressNameController,
                          validator: (value) => Validators.saddressName(value!),
                        ),

                        /// space
                        SizedBox(height: 16),

                        /// street address
                        CustomTextField(
                          label: 'street_address'.tr,
                          controller: _.streetAddressController,
                          validator:
                              (value) => Validators.streetAddress(value!),
                        ),

                        /// space
                        SizedBox(height: 16),

                        /// location
                        CustomCountryPicker(
                          countryPickerMode: CountryPickerMode.address,
                          onChangedCountry: ({required name, required code}) {
                            _.country = name; // Update the country
                            _.updateCountryCode(
                              code,
                            ); // Update the country code
                          },

                          onChangedProvince: (value) => _.stateProvince = value,
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
                                label: 'phone'.tr,
                                hintText: '991234567',
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
                                builder:
                                    (_) => CustomText(
                                      textDirection: TextDirection.ltr,
                                      _.countryCode ?? '+963',
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
                          label: 'notes'.tr,
                          controller: _.notesController,
                        ),
                      ],
                    ),
                  ),

                  /// space
                  const SizedBox(height: 48.0),
                ],
              ),
            ),
          ),

          /// save button
          Obx(
            () => CustomButton(
              isLoading: _.isLoading.value,
              width: double.infinity,
              buttonColor: AppColors.primaryColor,
              progressColor: AppColors.white,
              onPressed: _.addAddress,
              child: CustomText(color: AppColors.white, 'save'),
            ),
          ),
        ],
      ),
    );
  }
}
