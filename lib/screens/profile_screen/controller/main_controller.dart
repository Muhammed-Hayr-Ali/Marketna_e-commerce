import 'package:application/utils/import.dart';

class ProfileMainController {

  Future<bool> shouldSignOut() async {
    return await custombottomSheet<bool>(
          title: AppConstants.ARE_YOU_SURE_LOGOUT,

          children: [
            CustomButton(
              width: double.infinity,
              onPressed: () => Get.back(result: false),
              child: CustomText(AppConstants.CANCEL, fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              width: double.infinity,
              onPressed: () => Get.back(result: true),
              child: CustomText(AppConstants.LOGOUT, fontSize: 12),
            ),
          ],
        ) ??
        false;
  }
}
