import 'package:application/utils/import.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  AddressCard({super.key, required this.address});
  final _main = ManageAddressesMainController();

  @override
  Widget build(BuildContext context) {
    return CustomInkk(
      radius: 0,
      onLongPress: () => _main.openAddressDetails(address),
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
