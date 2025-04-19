import 'package:application/utils/import.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  AddressCard({super.key, required this.address});

  final _ = Get.find<ManageAddressesController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم العنوان
            if (address.addressName != null && address.addressName!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.location_on, color: AppColors.primaryColor),
                title: Text(
                  address.addressName!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            // العنوان الكامل
            if (address.streetAddress != null &&
                address.streetAddress!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.home, color: Colors.grey),
                title: Text(address.streetAddress!),
              ),
            if (address.city != null && address.city!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.location_city, color: Colors.grey),
                title: Text('${address.city}, ${address.province}'),
              ),
            if (address.country != null && address.country!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.flag, color: Colors.grey),
                title: Text(address.country!),
              ),

            // رقم الهاتف
            if (address.phoneNumber != null && address.phoneNumber!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.phone, color: Colors.grey),
                title: Text(address.phoneNumber!),
              ),

            // الملاحظات
            if (address.notes != null && address.notes!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.note, color: Colors.grey),
                title: Text(address.notes!),
              ),

            // أزرار التعديل والحذف
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed:
                      () => Get.toNamed(
                        AppRoutes.ADD_ADDRESSES_SCREEN,
                        arguments: {
                          'notes': address.notes,
                          'addressName': address.addressName,
                          'streetAddress': address.streetAddress,
                          'phoneNumber': address.phoneNumber,
                          'id': address.id,
                          'code': address.countryCode,
                          'flag': address.flag,
                          'country': address.country,
                          'city': address.city,
                          'province': address.province,
                        },
                      ),
                  icon: Icon(Icons.edit, color: AppColors.primaryColor),
                ),
                IconButton(
                  onPressed: () => _.dateAddress(address.id!),

                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
