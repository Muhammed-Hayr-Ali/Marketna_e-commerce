import 'package:application/screens/addresses/addresses_manage/widgets/address_card.dart';
import 'package:application/utils/import.dart';

class ManageAddressesScreen extends StatelessWidget {
  ManageAddressesScreen({super.key});

  final _ = Get.put(ManageAddressesController());

  void _navigateToScreen(String route) {
    Get.toNamed(route);
  }

Widget noAddressesWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.noLocation, width: Get.width * 0.4),
          const SizedBox(height: 24),
          const CustomText('no_addresses', fontSize: 18),
          const SizedBox(height: 16),
          CustomButton(
            width: 200,
            buttonColor: AppColors.primaryColor,
            child: CustomText('add_new_address', color: AppColors.white),
            onPressed: () => _navigateToScreen(AppRoutes.addAddressesScreen),
          ),
        ],
      ),
    );
  }
  Widget addressesWidget(AddressModel address) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: Column(
        children: [
          const CustomText('address_name'),
          CustomText(address.addressName ?? ''),
          const CustomText('street_address'),
          CustomText(address.streetAddress ?? ''),
          const CustomText('city'),
          CustomText(address.city ?? ''),
          const CustomText('state/province'),
          CustomText(address.stateProvince ?? ''),
          const CustomText('country'),
          CustomText(address.country ?? ''),
          const CustomText('phone_number'),
          CustomText(address.countryCode ?? ''),
          CustomText(address.phoneNumber ?? ''),
          const CustomText('notes'),
          CustomText(address.notes ?? ''),
          const CustomText('location'),
          CustomText('latitude ${address.location!['latitude']}'),
          CustomText('longitude ${address.location!['longitude']}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios),
        ),

        title: const CustomText('manage_addresses'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () =>
                    _.isLoading.value
                        ? const Center(
                          child: CircularProgressIndicator(strokeWidth: 2.0),
                        )
                        : _.addresses.isEmpty
                        ? noAddressesWidget()
                        : ListView.builder(
                          itemCount: _.addresses.length,
                          itemBuilder:
                              (context, index) => AddressCard(
                                addressName: _.addresses[index].addressName,
                                streetAddress: _.addresses[index].streetAddress,
                                city: _.addresses[index].city,
                                stateProvince: _.addresses[index].stateProvince,
                                country: _.addresses[index].country,
                                phoneNumber: _.addresses[index].phoneNumber,
                                notes: _.addresses[index].notes,
                              ),
                        ),
              ),
            ),
            CustomButton(
              width: double.infinity,
              buttonColor: AppColors.primaryColor,
              child: CustomText('add_new_address', color: AppColors.white),
              onPressed: () => _navigateToScreen(AppRoutes.addAddressesScreen),
            ),
          ],
        ),
      ),
    );
  }
}
