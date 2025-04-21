import 'package:application/utils/import.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  const AddressCard({super.key, required this.address});

  void _openAddressDetails() {
    custombottomSheet(
      title: AppConstants.ADDRESS_DETAILS,
      children: [
        /// address name
        CustomText(
          '${AppConstants.ADDRESS_NAME.tr} : ',
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        CustomText(
          address.addressName ?? '',
          fontWeight: FontWeight.w600,
        ),
        Divider(height: 28.0, color: Colors.grey.shade200),

        /// street address
        CustomText(
          '${AppConstants.STREET_ADDRESS.tr} : ',
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        CustomText(
          address.streetAddress ?? '',
          fontWeight: FontWeight.w600,
        ),
        Divider(height: 28.0, color: Colors.grey.shade200),

        /// location
        CustomText(
          '${AppConstants.COUNTRY.tr} : ',
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        CustomText(
          address.country ?? '',
          fontWeight: FontWeight.w600,
        ),
        Divider(height: 28.0, color: Colors.grey.shade200),
        CustomText(
          '${AppConstants.STATE_PROVINCE.tr} : ',
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        CustomText(
          address.province ?? '',
          fontWeight: FontWeight.w600,
        ),
        Divider(height: 28.0, color: Colors.grey.shade200),
        CustomText(
          '${AppConstants.CITY.tr} : ',
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        CustomText(
          address.city ?? '',
          fontWeight: FontWeight.w600,
        ),
        Divider(height: 28.0, color: Colors.grey.shade200),

        /// Phone
        CustomText(
          '${AppConstants.PHONENUMBER.tr} : ',
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        CustomText(
          textDirection: TextDirection.ltr,
          '${address.countryCode ?? ''} ${address.phoneNumber ?? ''}',
          fontWeight: FontWeight.w600,
        ),
        Divider(height: 28.0, color: Colors.grey.shade200),

        /// Notes
        CustomText(
          '${AppConstants.NOTES.tr} : ',
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        CustomText(
          address.notes ?? '',
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomInkk(
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
              '${address.streetAddress ?? ''}, ${address.city ?? ''}, ${address.province ?? ''}',
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
