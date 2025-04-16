import 'package:application/utils/import.dart';

class ManageAddressesScreen extends StatelessWidget {
  ManageAddressesScreen({super.key});

  final _ = Get.put(ManageAddressesController());

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
        child: GetBuilder<ManageAddressesController>(
          init: ManageAddressesController(),
          builder:
              (_) =>
                  _.isLoading
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
    );
  }
}
