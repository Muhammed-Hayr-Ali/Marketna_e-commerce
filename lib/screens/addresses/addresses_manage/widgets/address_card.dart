import 'package:application/utils/import.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  const AddressCard({super.key, required this.address});

  void _openAddressDetails() {
    custombottomSheet(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// address name
                  CustomText(
                    '${ConstantsText.ADDRESS_NAME.tr} : ',
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
                    '${ConstantsText.STREET_ADDRESS.tr} : ',
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
                    '${ConstantsText.COUNTRY.tr} : ',
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
                    '${ConstantsText.STATE_PROVINCE.tr} : ',
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
                    '${ConstantsText.CITY.tr} : ',
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
                    '${ConstantsText.PHONENUMBER.tr} : ',
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
                    '${ConstantsText.NOTES.tr} : ',
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
          onPressed: () => Get.back(),
          child: const CustomText('close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomInkk(
      radius: 0,
      onLongPress: _openAddressDetails,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(address.addressName ?? '', fontWeight: FontWeight.w600),
            SizedBox(height: 4.0),
            CustomText(
              '${address.street ?? ''}, ${address.city ?? ''}, ${address.province ?? ''}',
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                CustomText(
                  address.country ?? '',
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
                const SizedBox(width: 8.0),
                CustomText(
                  textDirection: TextDirection.ltr,
                  '${address.countryCode ?? ''}, ${address.phoneNumber ?? ''}',
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
