import 'package:application/constants/import.dart';

class ManageAddressesMainController {
  Future<bool> shouldDeleteAddress(String addressName) async {
    return await custombottomSheet<bool>(
          children: [
            CustomPageTitle(
              title: AppStrings.deleteAddress,
              subtitle: '${AppStrings.deleteAddressMessage.tr} $addressName',
              padding: EdgeInsets.only(bottom: 30.0),
            ),

            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: false),
              child: CustomText(AppStrings.no, fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: true),
              child: CustomText(AppStrings.yes, fontSize: 12),
            ),
          ],
        ) ??
        false;
  }

  void openAddressDetails(AddressModel address) {
    custombottomSheet(
      children: [
        CustomPageTitle(title: AppStrings.addressDetails),

        const SizedBox(height: 16),

        Divider(),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// address name
                  CustomText(
                    '${AppStrings.addressName.tr} : ',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      address.addressName ?? '',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),

                  /// street address
                  CustomText(
                    '${AppStrings.streetAddress.tr} : ',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      address.street ?? '',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),

                  /// location
                  CustomText(
                    '${AppStrings.country.tr} : ',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      address.country ?? '',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  CustomText(
                    '${AppStrings.stateProvince.tr} : ',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      address.province ?? '',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  CustomText(
                    '${AppStrings.city.tr} : ',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      address.city ?? '',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),

                  /// Phone
                  CustomText(
                    '${AppStrings.phoneNumber.tr} : ',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      textDirection: TextDirection.ltr,
                      '${address.countryCode ?? ''} ${address.phoneNumber ?? ''}',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),

                  /// Notes
                  CustomText(
                    '${AppStrings.notes.tr} : ',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      address.notes ?? '',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        CustomButton(
          width: double.infinity,
          backgroundColor: AppColors.grey,
          onPressed: () => Get.back(),
          child: CustomText(AppStrings.cancel),
        ),
      ],
    );
  }
}
