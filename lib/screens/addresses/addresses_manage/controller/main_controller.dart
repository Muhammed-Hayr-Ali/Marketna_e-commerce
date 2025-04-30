import 'package:application/utils/import.dart';

class ManageAddressesMainController {


  Future<bool> shouldDeleteAddress() async {
    return await custombottomSheet<bool>(
          title: ConstantsText.WANT_DELETE_ADDRESS,
          children: [
            CustomButton(
              width: double.infinity,
              onPressed: () => Get.back(result: false),
              child: CustomText(ConstantsText.NO, fontSize: 12),
            ),
            const SizedBox(height: 16),
            CustomButton(
              width: double.infinity,
              onPressed: () => Get.back(result: true),
              child: CustomText(ConstantsText.YES, fontSize: 12),
            ),
          ],
        ) ??
        false;
  }

}