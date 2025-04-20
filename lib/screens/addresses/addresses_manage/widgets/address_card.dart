import 'package:application/utils/import.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  AddressCard({super.key, required this.address});

  final _ = Get.find<ManageAddressesController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,

      color: Colors.grey.shade100,

      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم العنوان
            if (address.addressName != null && address.addressName!.isNotEmpty)
              Row(
                children: [
                  Icon(PhosphorIconsRegular.mapPin, size: 22.0),
                  const SizedBox(width: 8),
                  Text(
                    address.addressName!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 8),

            // العنوان الكامل (الشارع، المدينة، الدولة)
            if ((address.streetAddress != null &&
                    address.streetAddress!.isNotEmpty) ||
                (address.city != null && address.city!.isNotEmpty) ||
                (address.country != null && address.country!.isNotEmpty))
              Row(
                children: [
                  Icon(
                    PhosphorIconsRegular.house,
                    color: Colors.grey,
                    size: 22.0,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${address.streetAddress ?? ''}, ${address.city ?? ''}, ${address.province ?? ''}, ${address.country ?? ''}'
                          .trim(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 8),

            // رقم الهاتف
            if (address.phoneNumber != null && address.phoneNumber!.isNotEmpty)
              Row(
                children: [
                  Icon(
                    PhosphorIconsRegular.phone,
                    color: Colors.grey,
                    size: 22.0,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    textDirection: TextDirection.ltr,
                    '${address.countryCode ?? ''} ${address.phoneNumber ?? ''}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

            const SizedBox(height: 8),

            // الملاحظات
            if (address.notes != null && address.notes!.isNotEmpty)
              Row(
                children: [
                  Icon(
                    PhosphorIconsRegular.note,
                    color: Colors.grey,
                    size: 22.0,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      address.notes!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 16),

            // أزرار التعديل والحذف
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomCicularButton(
                  color: Colors.white,
                  borderColor: AppColors.primaryColor,
                  borderWidth: 1.5,
                  child: Icon(
                    PhosphorIconsRegular.pencilSimple,
                    color: AppColors.primaryColor,
                    size: 18.0,
                  ),
                  onTap:
                      () => Get.toNamed(
                        AppRoutes.ADD_ADDRESSES_SCREEN,
                        arguments: address,
                      ),
                ),

                const SizedBox(width: 8),

                CustomCicularButton(
                  borderColor: Colors.red,
                  borderWidth: 1.5,
                  color: Colors.white,
                  child: Icon(
                    PhosphorIconsRegular.trash,
                    color: Colors.red,
                    size: 16.0,
                  ),
                  onTap: () => _.dateAddress(address.id!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
