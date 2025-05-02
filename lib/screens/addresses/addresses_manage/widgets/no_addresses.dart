import 'package:application/utils/import.dart';

Widget noAddressesWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.noLocation, width: Get.width * 0.25),
        const SizedBox(height: 24),
        const CustomText(ConstantsText.NO_ADDRESSES, fontSize: 14),

        const SizedBox(height: 32),

        CustomButton(
          width: Get.width * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 16),
          onPressed: () => Get.toNamed(Routes.ADD_ADDRESSES_SCREEN),
          child: CustomText(ConstantsText.ADD_NEW_ADDRESS, color: Colors.white),
        ),
      ],
    ),
  );
}
