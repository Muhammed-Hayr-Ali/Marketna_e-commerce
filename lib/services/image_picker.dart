
import 'package:application/constants/import.dart';

class ImageService {
  final _picker = ImagePicker();

  Future<XFile?> getImageFromGallery() async {
    final bool accessStorage = await PermissionHandler.requestPermission(
      Permission.mediaLibrary,
    );

    if (!accessStorage) {
      CustomNotification.showToast(message: 'Permission Denied');
      return null;
    }

    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 300,
      maxWidth: 300,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      return pickedFile;
    }
    return null;
  }

  Future<XFile?> getImageFromCamera() async {
    final bool accessCamera = await PermissionHandler.requestPermission(
      Permission.camera,
    );

    if (!accessCamera) {
      CustomNotification.showToast(message: 'Permission Denied');
      return null;
    }

    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 300,
      maxWidth: 300,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      return pickedFile;
    }
    return null;
  }
}
