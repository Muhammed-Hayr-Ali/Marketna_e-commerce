import 'dart:io';

import 'package:application/utils/import.dart';

class EditProfileController extends GetxController {
  final supabase = Supabase.instance.client;

  final _profileController = Get.find<ProfileController>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  String? email;
  String? selectedCountryCode;
  final phoneController = TextEditingController();
  String? phoneErrorMessage;
  String? countryCodeErrorMessage;
  String? gender;
  String? dateBirth;

  RxBool isLoading = false.obs;
  bool imageLoading = false;
  User? user;
  String? imagePath;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  /// Initializes the controller with the user's current information.
  ///
  /// This function is called when the controller is initialized.
  void _initialize() {
    User? currentUser = supabase.auth.currentUser;
    final userMetadata = currentUser?.userMetadata;

    // Check if the user is logged in
    if (currentUser == null) return;

    // Set the user object to the current user
    user = currentUser;

    // Set the name controller text to the user's name
    nameController.text = DataConverter.getUserName(currentUser.userMetadata!);

    // Set the email field to the user's email
    email = currentUser.email;

    // Set the country code to the user's country code

    // Set the country code controller text to the user's country code
    selectedCountryCode = userMetadata?[ConstantsText.COUNTRY_CODE];

    // Set the phone controller text to the user's phone number
    phoneController.text = userMetadata?[ConstantsText.PHONE] ?? '';

    // Set the gender to the user's gender
    gender = userMetadata?[ConstantsText.GENDER] ?? '';

    // Set the date of birth to the user's date of birth
    dateBirth = userMetadata?[ConstantsText.DATE_BIRTH] ?? '';

    // Update the UI
    update();
  }

  void updatePath(String? value) {
    imagePath = value;
    update();
  }

  /// Deletes the profile image from the bucket.
  Future<void> deleteImage(bool withUpdate) async {
    debugPrint('deleteImage');

    // Check if the user is logged in
    if (user == null) return;

    // Get the avatar URL from the user's metadata
    String? avatarUrl =
        user!.userMetadata![ConstantsText.AVATAR] ??
        user!.userMetadata![ConstantsText.AVATAR_URL];

    if (avatarUrl == null || avatarUrl.isEmpty) return;

    if (withUpdate) {
      imageLoading = true;
      update();
    }

    try {
      // Get the file name from the avatar URL
      final String fileName = avatarUrl.split('/').last;
      // Get the folder name from the user ID
      final String folderName = user!.id;
      // Delete the file from the bucket
      await supabase.storage
          .from(KEYS.USERS_BUCKET)
          .remove(['${KEYS.PROFILE_FOLDER}/$folderName/$fileName'])
          .whenComplete(
            () async => await supabase.auth.updateUser(
              UserAttributes(data: {ConstantsText.AVATAR: null}),
            ),
          );

      debugPrint('Image deleted successfully');
    } on StorageException catch (error) {
      debugPrint(error.message.toString());
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${ConstantsText.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      // If [withUpdate] is true, refresh the UI
      if (withUpdate) {
        _initialize();
        _profileController.initializeCurrentUser();
        imageLoading = false;
        update();
      }
    }
  }

  /// Uploads the image to the Supabase Storage
  Future<void> _uploadImage() async {
    debugPrint('updateUser');

    if (imagePath == null) return;

    debugPrint('try delete old image');
    imageLoading = true;
    update();

    await deleteImage(false);

    try {
      final String fileExtension = DataConverter.getFileExtension(imagePath!);
      final String fileName = Uuid().v1() + fileExtension;
      final String folderName = user!.id;

      // Upload the image to the Supabase Storage
      await supabase.storage
          .from(KEYS.USERS_BUCKET)
          .upload(
            '${KEYS.PROFILE_FOLDER}/$folderName/$fileName',
            File(imagePath!),
          );

      // Update the user's avatar with the new image
      String url = supabase.storage
          .from(KEYS.USERS_BUCKET)
          .getPublicUrl('${KEYS.PROFILE_FOLDER}/$folderName/$fileName');

      await supabase.auth.updateUser(
        UserAttributes(data: {ConstantsText.AVATAR: url}),
      );
    } on StorageException catch (error) {
      // Show an error message if the upload or update process failed
      debugPrint(error.message.toString());
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${ConstantsText.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      imageLoading = false;
      update();
    }
  }

  /// Copies the email to the clipboard.
  void copyEmailToClipboard() {
    if (email == null) return;

    Clipboard.setData(ClipboardData(text: email!));
    CustomNotification.showToast(message: ConstantsText.EMAIL_COPIED);
  }

  /// updates Country Code
  void updateCountryCode(String? value) {
    selectedCountryCode = value;
    update();
  }

  /// Updates the user gender.
  void updateGender(String value) {
    gender = value;
    update();
  }

  /// Updates the user date of birth.
  void updateDateBirth(String value) {
    dateBirth = value;
    update(); // Refresh UI to reflect changes
  }

  /// Updates the user profile information.
  Future<void> updateUser() async {
    debugPrint(phoneController.text.trim());
    phoneErrorMessage = Validators.phoneNumber(phoneController.text);
    countryCodeErrorMessage = Validators.countryCode(selectedCountryCode ?? '');
    update();

    if (!formKey.currentState!.validate() ||
        phoneErrorMessage != null ||
        countryCodeErrorMessage != null) {
      return;
    }

    isLoading.value = true;

    try {
      // Upload the image to the Supabase Storage
      await _uploadImage();

      // Update the user's information in the Supabase database
      await supabase.auth.updateUser(
        UserAttributes(
          data: {
            ConstantsText.DISPLAY_NAME: nameController.text.trim(),
            ConstantsText.USER_NAME: DataConverter.removeTextAfterAt(
              email!.trim(),
            ),
            ConstantsText.COUNTRY_CODE: selectedCountryCode,
            ConstantsText.PHONE: phoneController.text.trim(),
            ConstantsText.GENDER: gender,
            ConstantsText.DATE_BIRTH: dateBirth,
          },
        ),
      );

      // Show a snackbar with the message 'Profile updated successfully'
      CustomNotification.showSnackbar(
        message: ConstantsText.PROFILE_UPDATED_SUCCESSFULLY,
      );
    } on AuthException catch (error) {
      // Show a snackbar with the error message
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      // Handle other errors and show error message in a snackbar
      CustomNotification.showSnackbar(
        message: '${ConstantsText.ERROR.tr} $error',
      );
      debugPrint(error.toString());
    } finally {
      // Reset the form and set the loading state to false
      _initialize();
      _profileController.initializeCurrentUser();
      isLoading.value = false;
      imagePath = null;
      update();
    }
  }
}
