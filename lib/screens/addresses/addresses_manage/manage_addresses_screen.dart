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

        // title: const CustomText(AppConstants.MANAGE_ADDRESSES),

        // actions: [
        //   SizedBox(
        //     child: IconButton(
        //       onPressed: () {
        //         Get.toNamed(AppRoutes.ADD_ADDRESSES_SCREEN);
        //       },
        //       icon: const Icon(Icons.add),
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const CustomText(
              AppConstants.MANAGE_ADDRESSES,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 18),
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoutes.ADD_ADDRESSES_SCREEN);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                    size: 28,
                  ),
                  const SizedBox(width: 8.0),
                  const CustomText(
                    AppConstants.ADD_NEW_ADDRESS,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300, thickness: 1.0),
            const SizedBox(height: 20),
            GetBuilder<ManageAddressesController>(
              init: ManageAddressesController(),
              builder:
                  (controller) => Expanded(
                    child:
                        controller.isLoading
                            ? const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
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
          ],
        ),
      ),
    );
  }
}
