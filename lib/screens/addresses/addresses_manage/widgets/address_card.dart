import 'package:application/utils/import.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  AddressCard({super.key, required this.address});

  final _ = Get.find<ManageAddressesController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,

      color: Colors.transparent,

      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),

      child: Container(
        padding: const EdgeInsets.only(bottom: 4.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  address.addressName ?? '',
                  fontWeight: FontWeight.w600,
                ),
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
            Icon(Icons.more_vert_rounded),
          ],
        ),
      ),
    );
  }
}
