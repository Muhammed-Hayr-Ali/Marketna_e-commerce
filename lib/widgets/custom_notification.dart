import 'package:application/utils/import.dart';

class CustomNotification {
  CustomNotification._();

  static showToast({String? title, required String message}) {
    Fluttertoast.showToast(
      msg: message.tr,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );
  }

  static showSnackbar({String? title, required String message}) {
    if (message.contains('ClientException with SocketException')) {
      CustomNotification.showSnackbar(message: 'network_error');
    }

    Get.snackbar(
      '',
      '',
      titleText: title != null ? CustomText(title, fontSize: 14.0) : SizedBox(),
      messageText: CustomText(message, fontSize: 12.0),
      borderRadius: 4.0,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      duration: const Duration(seconds: 3),
    );
  }
}
