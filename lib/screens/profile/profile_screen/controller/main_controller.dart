
import 'package:application/constants/import.dart';

class ProfileMainController {
  Future<bool> shouldSignOut() async {
    return await custombottomSheet<bool>(
          children: [
            CustomPageTitle(
              title: AppStrings.logout,
              subtitle: AppStrings.logoutSubTitle,
              padding: const EdgeInsets.only(bottom: 30.0),
            ),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: true),
              child: CustomText(AppStrings.logoutButtonText, fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: false),
              child: CustomText(AppStrings.cancel, fontSize: 12),
            ),
          ],
        ) ??
        false;
  }
}
