import 'package:application/utils/import.dart';

class ManageAddressesScreen extends StatelessWidget {
  const ManageAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios),
        ),

        title: const CustomText(AppConstants.MANAGE_ADDRESSES),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GetBuilder<ManageAddressesController>(
          init: ManageAddressesController(),

          builder:
              (Controller) =>
                  Controller.isLoading
                      ? const Center(
                        child: CircularProgressIndicator(strokeWidth: 2.0),
                      )
                      : Controller.addresses.isEmpty
                      ? noAddressesWidget()
                      : ListView.builder(
                        itemCount: Controller.addresses.length,
                        itemBuilder:
                            (context, index) => AddressCard(
                              address: Controller.addresses[index],
                            ),
                      ),
        ),
      ),
    );
  }
}
