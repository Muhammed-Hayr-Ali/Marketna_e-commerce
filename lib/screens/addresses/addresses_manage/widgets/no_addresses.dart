import 'package:application/utils/import.dart';

Widget noAddressesWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.noLocation, width: Get.width * 0.25),
        const SizedBox(height: 24),
        const CustomText('no_addresses', fontSize: 14),

        const SizedBox(height: 32),

        CustomButton(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          borderRadius: 60,
          onPressed: () => Get.toNamed(AppRoutes.ADD_ADDRESSES_SCREEN),
          child: CustomText('add_new_address'.tr),
        ),
      ],
    ),
  );
}
