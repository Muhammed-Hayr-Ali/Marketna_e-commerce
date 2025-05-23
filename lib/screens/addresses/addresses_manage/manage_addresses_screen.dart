import 'package:application/constants/import.dart';

class ManageAddressesScreen extends StatelessWidget {
  const ManageAddressesScreen({super.key});

  String _getLocale() {
    String locale = Get.locale!.languageCode;
    return locale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(backButton: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: const CustomText(
              AppStrings.manageAddresses,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          GetBuilder<ManageAddressesController>(
            init: ManageAddressesController(),
            builder:
                (controller) => Expanded(
                  child:
                      controller.isLoading
                          ? const Center(
                            child: CircularProgressIndicator(strokeWidth: 2.0),
                          )
                          : controller.addresses.isEmpty ||
                              controller.addresses == []
                          ? noAddressesWidget()
                          : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CustomButton(
                                  backgroundColor: AppColors.grey,
                                  onPressed: () {
                                    Get.toNamed(Routes.ADD_ADDRESSES_SCREEN);
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: AppColors.rurikonBlue,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 8.0),
                                      const CustomText(
                                        AppStrings.addNewAddress,
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.separated(
                                  itemCount: controller.addresses.length,
                                  itemBuilder: (context, index) {
                                    final address =
                                        controller
                                            .addresses[index]; // الحصول على العنوان الحالي
                                    return Dismissible(
                                      key: Key(
                                        address.id.toString(),
                                      ), // تحديد مفتاح فريد لكل عنصر
                                      background: Container(
                                        alignment:
                                            _getLocale() == FieldValues.ar
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,

                                        color:
                                            AppColors
                                                .primaryColor, // خلفية زرقاء عند التمرير من اليسار إلى اليمين
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Icon(
                                          Icons.edit,
                                          color: AppColors.white,
                                        ), // أيقونة التعديل
                                      ),
                                      secondaryBackground: Container(
                                        alignment:
                                            _getLocale() == FieldValues.ar
                                                ? Alignment.centerLeft
                                                : Alignment.centerRight,
                                        color:
                                            AppColors
                                                .errorRed, // خلفية حمراء عند التمرير من اليمين إلى اليسار
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),

                                        child: Icon(
                                          Icons.delete,
                                          color: AppColors.white,
                                        ), // أيقونة الحذف
                                      ),

                                      confirmDismiss: (direction) async {
                                        // تأكيد الإجراء قبل تنفيذه
                                        if (direction ==
                                            DismissDirection.endToStart) {
                                          // التمرير من اليمين إلى اليسار (حذف)
                                          controller.dateAddress(
                                            address.id!,
                                            address.addressName!,
                                          );
                                          return false; // لا تحذف العنصر من القائمة
                                        } else if (direction ==
                                            DismissDirection.startToEnd) {
                                          // التمرير من اليسار إلى اليمين (تعديل)
                                          Get.toNamed(
                                            Routes.ADD_ADDRESSES_SCREEN,
                                            arguments: address,
                                          );
                                          return false; // لا تحذف العنصر من القائمة
                                        }
                                        return false; // تأكد من أن العنصر لا يزال موجودًا
                                      },
                                      child: AddressCard(
                                        address:
                                            address, // تمرير العنوان إلى ويدجت AddressCard
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          Divider(
                                            color: Colors.grey.shade300,
                                            height: 1.0,
                                            thickness: 1.0,
                                          ),
                                ),
                              ),
                            ],
                          ),
                ),
          ),
        ],
      ),
    );
  }
}
