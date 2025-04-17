import 'package:application/utils/import.dart';

class ManageAddressesMainController {


  Future<bool> shouldDeleteAddress() async {
    return await custombottomSheet<bool>(
          title: AppConstants.WANT_DELETE_ADDRESS,
          children: [
            CustomButton(
              width: double.infinity,
              onPressed: () => Get.back(result: false),
              child: CustomText(AppConstants.NO, fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              width: double.infinity,
              onPressed: () => Get.back(result: true),
              child: CustomText(AppConstants.YES, fontSize: 12),
            ),
          ],
        ) ??
        false;
  }

}