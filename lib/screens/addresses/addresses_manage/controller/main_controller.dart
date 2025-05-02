import 'package:application/utils/import.dart';

class ManageAddressesMainController {
  Future<bool> shouldDeleteAddress(String addressName) async {
    return await custombottomSheet<bool>(
          children: [
            const SizedBox(height: 16),
            CustomText(ConstantsText.WANT_DELETE_ADDRESS.tr),
            const SizedBox(height: 14),

            CustomText(addressName, fontWeight: FontWeight.w500),
            const SizedBox(height: 20),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: false),
              child: CustomText(ConstantsText.NO, fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: true),
              child: CustomText(ConstantsText.YES, fontSize: 12),
            ),
          ],
        ) ??
        false;
  }
}
