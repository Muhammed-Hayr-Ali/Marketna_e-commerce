import 'package:application/utils/import.dart';

class ProfileMainController {
  Future<bool> shouldSignOut() async {
    return await custombottomSheet<bool>(
          children: [
            CustomPageTitle(
              title: 'Logout',
              subtitle: 'Are you sure you want to logout?',
              padding: const EdgeInsets.only(bottom: 30.0),
            ),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: true),
              child: CustomText('Logout Now', fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              backgroundColor: AppColors.grey,
              onPressed: () => Get.back(result: false),
              child: CustomText('Cancel', fontSize: 12),
            ),
          ],
        ) ??
        false;
  }
}
