import 'dart:io';
import 'package:application/constants/import.dart';

class EditProfileController extends GetxController {
  /// Instances
  final _supabase = Supabase.instance.client;
  final _profileController = Get.find<ProfileController>();
  final _mainController = EditProfileMainController();
  final _picker = ImagePicker();

  /// Variables

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final statusMessageController = TextEditingController();
  final phoneController = TextEditingController();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  final RxBool _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;
  final RxBool _isImageLoading = false.obs;
  bool get isImageLoading => _isImageLoading.value;
  final RxString _email = ''.obs;
  String get email => _email.value;
  final RxString _countryCode = ''.obs;
  String get countryCode => _countryCode.value;
  final RxString _gender = ''.obs;
  String get gender => _gender.value;
  final RxString _dateBirth = ''.obs;
  String get dateBirth => _dateBirth.value;
  final RxString _countryCodeErrorMessage = ''.obs;
  String get cCodeEMe => _countryCodeErrorMessage.value;
  final RxString _phoneErrorMessage = ''.obs;
  String get phoneEM => _phoneErrorMessage.value;
  final RxString _avatar = ''.obs;
  String get avatar => _avatar.value;
  final RxString _imagePath = ''.obs;
  String get imagePath => _imagePath.value;

  @override
  void onInit() {
    super.onInit();
    initializeUser();
  }

  void initializeUser() async {
    try {
      _isLoading.value = true;
      final currentUser = _supabase.auth.currentUser;
      if (currentUser == null) return;
      final metadata = UserMetaDataModel.fromJson(
        currentUser.userMetadata ?? {},
      );
      _avatar.value = metadata.avatar ?? metadata.avatarUrl ?? '';
      _email.value = currentUser.email ?? '';
      _countryCode.value = metadata.countryCode ?? '';
      _gender.value = metadata.gender ?? FieldValues.notSpecified;
      _dateBirth.value = metadata.dateBirth ?? '';
      nameController.text = metadata.name ?? '';
      statusMessageController.text = metadata.statusMessage ?? '';
      phoneController.text = metadata.phone ?? '';
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> pickImage(bool isDelete) async {
    final result = await _mainController.openImageSource(isDelete);
    if (result == null) return;
    if (result == FieldValues.camera) {
      final image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        updateImagePath(image.path);
      }
    } else if (result == FieldValues.gallery) {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        updateImagePath(image.path);
      }
    } else if (result == FieldValues.delete) {
      try {
        _isImageLoading.value = true;
        if (_avatar.value.isEmpty) return;
        final String fileName = _avatar.value.split('/').last;
        final String folderName = _supabase.auth.currentUser!.id;

        await _supabase.storage
            .from(BucketNames.users)
            .remove(['${BucketNames.profile}/$folderName/$fileName'])
            .whenComplete(
              () async => await _supabase.auth.updateUser(
                UserAttributes(data: {Attributes.avatar: null}),
              ),
            );

        debugPrint('Image deleted successfully');
        _avatar.value = '';
      } on StorageException catch (error) {
        debugPrint(error.message.toString());
        CustomNotification.showSnackbar(message: error.message);
      } catch (error) {
        CustomNotification.showSnackbar(
          message:NotificationMessage.somethingWentWrong,
        );
      } finally {
        _isImageLoading.value = false;
      }
    }
  }

  void updateImagePath(String path) {
    _imagePath.value = path;
  }

  /// Copies the email to the clipboard.
  void copyEmailToClipboard(String? email) {
    if (email == null) return;
    Clipboard.setData(ClipboardData(text: email));
    CustomNotification.showToast(message: NotificationMessage.emailCopied);
  }

  void updateCountryCode(String countryCode) {
    _countryCode.value = countryCode;
    _countryCodeErrorMessage.value = '';
  }

  Future<void> updateGender(String gender) async {
    final result = await _mainController.openGenderBottomSheet(gender);
    if (result != null) {
      _gender.value = result;
    }
  }

  Future<void> updateDateOfBirth() async {
    final selectedDate = await _mainController.openDateOfBirth(
      initialDate: _dateBirth.value,
    );
    if (selectedDate != null) {
      _dateBirth.value = DateFormat(AppStrings.dateFormat).format(selectedDate);
    }
  }

  Future<String?> _uploadImage(String imagePath) async {
    try {
      _isImageLoading.value = true;
      final String fileExtension = DataConverter.getFileExtension(imagePath);
      final String fileName = Uuid().v1() + fileExtension;
      final String folderName = _supabase.auth.currentUser!.id;

      // Upload the image to the Supabase Storage
      await _supabase.storage
          .from(BucketNames.users)
          .upload(
            '${BucketNames.profile}/$folderName/$fileName',
            File(imagePath),
          );

      // Update the user's avatar with the new image
      String url = _supabase.storage
          .from(BucketNames.users)
          .getPublicUrl('${BucketNames.profile}/$folderName/$fileName');

      _imagePath.value = '';
      return url;
    } on Exception catch (error) {
      CustomNotification.showToast(
        message: NotificationMessage.imageUploadFailed,
      );
      debugPrint(error.toString());
      return null;
    } finally {
      _isImageLoading.value = false;
    }
  }

  Future<void> _removeImage(String avatar) async {
    try {
      _isImageLoading.value = true;
      final String fileName = avatar.split('/').last;
      final String folderName = _supabase.auth.currentUser!.id;

      await _supabase.storage
          .from(BucketNames.users)
          .remove(['${BucketNames.profile}/$folderName/$fileName'])
          .whenComplete(
            () async => await _supabase.auth.updateUser(
              UserAttributes(data: {Attributes.avatar: null}),
            ),
          );

      _avatar.value = '';
      debugPrint('Image deleted successfully');
    } on Exception catch (error) {
      CustomNotification.showToast(
        message: NotificationMessage.imageDeleteFailed,
      );
      debugPrint(error.toString());
    } finally {
      _isImageLoading.value = false;
    }
  }

  Future<void> updateUserProfile() async {
    try {
      _isUpdateLoading.value = true;

      if (_countryCode.value.isEmpty) {
        _countryCodeErrorMessage.value = ValidatorMessage.countryCodeRequired;
      }
      if (phoneController.text.isEmpty) {
        _countryCodeErrorMessage.value = ValidatorMessage.phoneNumberRequired;
      }

      final isValid = formKey.currentState!.validate();

      if (!isValid ||
          _countryCodeErrorMessage.value.isNotEmpty ||
          _phoneErrorMessage.value.isNotEmpty) {
        return;
      }

      if (_imagePath.value != '') {
        await _removeImage(_imagePath.value);
        _avatar.value = await _uploadImage(_imagePath.value) ?? _avatar.value;
      }

      final metadata = UserMetaDataModel(
        avatar: _avatar.value,
        name: nameController.text.trim(),
        statusMessage: statusMessageController.text.trim(),
        countryCode: _countryCode.value,
        phone: phoneController.text.trim(),
        gender: _gender.value,
        dateBirth: _dateBirth.value,
      );

      await _supabase.auth.updateUser(UserAttributes(data: metadata.toJson()));
    } on Exception catch (error) {
      CustomNotification.showSnackbar(message: error.toString());
    } finally {
      await _profileController.initializeUser();
      _isUpdateLoading.value = false;
    }
  }
}
