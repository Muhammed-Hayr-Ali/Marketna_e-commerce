import 'package:application/utils/import.dart';

class ProfileMainController {

  Future<bool> shouldSignOut() async {
    return await custombottomSheet<bool>(
          title: 'are_you_sure_logout',

          children: [
            CustomButton(
              width: double.infinity,
              onPressed: () => Get.back(result: false),
              child: CustomText('cancel', fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              width: double.infinity,
              onPressed: () => Get.back(result: true),
              child: CustomText('logout', fontSize: 12),
            ),
          ],
        ) ??
        false;
  }
}
