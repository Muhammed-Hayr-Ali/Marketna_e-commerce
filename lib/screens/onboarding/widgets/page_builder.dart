
import 'package:application/utils/import.dart';

Widget pageBuilder(
    {required String image, required String title, required String subtitle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      const SizedBox(),
      Image.asset(
        image,
        height: Get.width * 0.4,
        width: Get.width * 0.4,
      ),
      SizedBox(
        width: Get.width * 0.8,
        child: Column(
          children: [
            CustomText(
              title,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 14.0),
            CustomText(
              subtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ],
  );
}
