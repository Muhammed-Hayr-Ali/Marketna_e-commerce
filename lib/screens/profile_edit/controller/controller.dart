import 'dart:io';

import 'package:application/utils/import.dart';

class EditProfileController extends GetxController {
  final supabase = Supabase.instance.client;

  final _profileController = Get.find<ProfileController>();
  final _main = EditProfileMainController();
  final _imageService = ImageService();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  String? email;
  String? countryCode;
  final phoneController = TextEditingController();
  String? gender;
  String? dateBirth;

  RxBool isLoading = false.obs;
  RxBool imageIsLoading = false.obs;
  User? user;
  String? imagePath;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  void _initialize() {
    user = supabase.auth.currentUser;
    nameController.text = _main.getUserName(user);
    email = user!.email ?? '';
    countryCode = user!.userMetadata!['country_code'];
    phoneController.text = user!.userMetadata!['phone'] ?? '';
    gender = user!.userMetadata!['gender'];
    dateBirth = user!.userMetadata!['date_birth'];

    update();
  }

  Future<void> selectImage() async {
    debugPrint('select Image');

    final result = await _main.openSelectImageSource();

    if (result == null) return;
    switch (result) {
      case 'camera':
        _selectImageFromCamera();
        break;
      case 'gallery':
        _selectImageFromGallery();
        break;
      case 'delete':
        _deleteImage(true);
        break;
      default:
        null;
    }
  }

  void _selectImageFromGallery() async {
    final XFile? file = await _imageService.getImageFromGallery();
    if (file == null) return;
    imagePath = file.path;
    update();
  }

  void _selectImageFromCamera() async {
    final XFile? file = await _imageService.getImageFromCamera();
    if (file == null) return;
    imagePath = file.path;
    update();
  }

  Future<void> clearImagePath() async {
    debugPrint('clear Image Path');
    imagePath = null;
    update();
  }

  Future<void> _deleteImage(bool withUpdate) async {
    debugPrint('deleteImage');

    if (_main.getAvatarUrl(user!.userMetadata!) == '') return;
    imageIsLoading(true);
    try {
      final String fileName =
          _main.getAvatarUrl(user!.userMetadata!).split('/').last;
      final String folderName = user!.id;
      await supabase.storage
          .from(AppConstants.usersBucket)
          .remove(['${AppConstants.profileFolder}/$folderName/$fileName'])
          .whenComplete(
            () async => await supabase.auth.updateUser(
              UserAttributes(data: {'avatar': null}),
            ),
          );

      debugPrint('Image deleted successfully');
    } on StorageException catch (error) {
      debugPrint(error.message.toString());
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      if (withUpdate && withUpdate) _initialize();
      _profileController.initialize();
      imageIsLoading(false);
    }
  }

  String _getFileExtension(String fileName) {
    try {
      return ".${fileName.split('.').last}";
    } catch (e) {
      return '';
    }
  }

  Future<void> _uploadImage() async {
    debugPrint('updateUser');

    if (imagePath == null) return;
    debugPrint('try delete old image');
    await _deleteImage(false);

    imageIsLoading(true);
    try {
      final String fileExtension = _getFileExtension(imagePath!);
      final String fileName = Uuid().v1() + fileExtension;
      final String folderName = user!.id;

      await supabase.storage
          .from(AppConstants.usersBucket)
          .upload(
            '${AppConstants.profileFolder}/$folderName/$fileName',
            File(imagePath!),
          )
          .whenComplete(() async {
            debugPrint('Image uploaded successfully');

            String url = supabase.storage
                .from(AppConstants.usersBucket)
                .getPublicUrl(
                  '${AppConstants.profileFolder}/$folderName/$fileName',
                );

            await supabase.auth.updateUser(
              UserAttributes(data: {'avatar': url}),
            );
          });
    } on StorageException catch (error) {
      debugPrint(error.message.toString());
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      imagePath = null;
      imageIsLoading(false);
    }
  }

  void copyToClipboard() {
    if (email == null) return;
    Clipboard.setData(ClipboardData(text: email ?? ''));
    CustomNotification.showToast(message: 'Email_copied');
  }

  void updateGender(String value) {
    gender = value;
    update();
  }

  void updateDateBirth(String value) {
    dateBirth = value;
    update();
  }

  Future<void> updateUser() async {
    debugPrint('updateUser');

    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    debugPrint('try upload new image');
    await _uploadImage();
    debugPrint('try upload user Attributes');
    try {
      isLoading.value = true;
      await supabase.auth.updateUser(
        UserAttributes(
          data: {
            'display_name': nameController.text.trim(),
            'user_name':
                email == null ? '' : _main.removeTextAfterAt(email!.trim()),
            'country_code': countryCode,
            'phone': phoneController.text.trim(),
            'gender': gender,
            'date_birth': dateBirth,
          },
        ),
      );

      debugPrint('profile updated successfully');
      CustomNotification.showSnackbar(message: 'profile_updated_successfully');
    } on AuthException catch (error) {
      debugPrint(error.message.toString());
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      _initialize();
      _profileController.initialize();
      isLoading.value = false;
    }
  }

  void updateCountryCode(code) {
    countryCode = code;
    update();
  }
}
