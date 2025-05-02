import 'package:application/utils/import.dart';

class ProfileMainController {
  Future<bool> shouldSignOut() async {
    return await custombottomSheet<bool>(
          children: [
            const SizedBox(height: 16),
            CustomText(
              ConstantsText.LOGOUT,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 20),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: false),
              child: CustomText(ConstantsText.CANCEL, fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: true),
              child: CustomText(ConstantsText.LOGOUT, fontSize: 12),
            ),
          ],
        ) ??
        false;
  }
}
