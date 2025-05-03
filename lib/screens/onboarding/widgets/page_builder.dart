import 'package:application/utils/import.dart';

Widget pageBuilder({
  required String image,
  required String title,
  required String subtitle,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(image, height: Get.width * 0.4, width: Get.width * 0.4),
      const SizedBox(height: 32.0),
      CustomText(
        title,
        textAlign: TextAlign.center,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      const SizedBox(height: 14.0),
      CustomText(subtitle, textAlign: TextAlign.center),
    ],
  );
}
