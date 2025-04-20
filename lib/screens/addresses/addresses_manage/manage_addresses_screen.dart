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

        actions: [
          SizedBox(
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.ADD_ADDRESSES_SCREEN);
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          GetBuilder<ManageAddressesController>(
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
                        : Expanded(
                          child: ListView.builder(
                            itemCount: controller.addresses.length,
                            itemBuilder:
                                (context, index) => AddressCard(
                                  address: controller.addresses[index],
                                ),
                          ),
                        ),
          ),
        ],
      ),
    );
  }
}
