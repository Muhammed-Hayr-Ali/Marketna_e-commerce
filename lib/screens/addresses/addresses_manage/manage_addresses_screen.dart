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
              (controller) =>
                  controller.isLoading
                      ? const Center(
                        child: CircularProgressIndicator(strokeWidth: 2.0),
                      )
                      : controller.addresses.isEmpty ||
                          controller.addresses == []
                      ? noAddressesWidget()
                      : ListView.builder(
                        itemCount: controller.addresses.length,
                        itemBuilder:
                            (context, index) => AddressCard(
                              address: controller.addresses[index],
                            ),
                      ),
        ),
      ),
    );
  }
}
