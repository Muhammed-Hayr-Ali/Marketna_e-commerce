import 'package:application/utils/import.dart';

class AddressCard extends StatelessWidget {
  final String? addressName;
  final String? streetAddress;
  final String? city;
  final String? stateProvince;
  final String? country;
  final String? phoneNumber;
  final String? notes;

  const AddressCard({
    super.key,
    this.addressName,
    this.streetAddress,
    this.city,
    this.stateProvince,
    this.country,
    this.phoneNumber,
    this.notes,
  });

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
            if (addressName != null && addressName!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.location_on, color: AppColors.primaryColor),
                title: Text(
                  addressName!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            // العنوان الكامل
            if (streetAddress != null && streetAddress!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.home, color: Colors.grey),
                title: Text(streetAddress!),
              ),
            if (city != null && city!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.location_city, color: Colors.grey),
                title: Text('$city, $stateProvince'),
              ),
            if (country != null && country!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.flag, color: Colors.grey),
                title: Text(country!),
              ),

            // رقم الهاتف
            if (phoneNumber != null && phoneNumber!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.phone, color: Colors.grey),
                title: Text(phoneNumber!),
              ),

            // الملاحظات
            if (notes != null && notes!.isNotEmpty)
              ListTile(
                leading: Icon(Icons.note, color: Colors.grey),
                title: Text(notes!),
              ),

            // أزرار التعديل والحذف
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Navigate to edit screen
                  },
                  icon: Icon(Icons.edit, color: AppColors.primaryColor),
                ),
                IconButton(
                  onPressed: () {
                    // Delete address logic
                  },
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
