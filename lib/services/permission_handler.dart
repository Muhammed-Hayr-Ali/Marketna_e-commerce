import 'package:application/constants/import.dart';

class PermissionHandler {
  PermissionHandler._();

  static Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      return true;
    }
    return false;
  }
}
