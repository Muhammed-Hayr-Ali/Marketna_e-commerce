import 'package:application/utils/import.dart';

class ManageAddressesMainController {
  Future<bool> shouldDeleteAddress(String addressName) async {
    return await custombottomSheet<bool>(
          children: [
            CustomPageTitle(
              title: 'Delete Address',
              subtitle:
                  '${'Are you sure you want to delete this address?'.tr} $addressName',
              padding: EdgeInsets.only(bottom: 16.0),
            ),

            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: false),
              child: CustomText('NO', fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: true),
              child: CustomText('YES', fontSize: 12),
            ),
          ],
        ) ??
        false;
  }

  void openAddressDetails(AddressModel address) {
    custombottomSheet(
      children: [
        CustomPageTitle(title: 'Address Details'),
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
                    '${'Address Name'.tr} : ',
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
                    '${'Street Address'.tr} : ',
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
                    '${'Country'.tr} : ',
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
                    '${'State / Province'.tr} : ',
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
                    '${'City'.tr} : ',
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
                    '${'Phone Number'.tr} : ',
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
                    '${'Notes'.tr} : ',
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
          child: const CustomText('Close'),
        ),
      ],
    );
  }
}
