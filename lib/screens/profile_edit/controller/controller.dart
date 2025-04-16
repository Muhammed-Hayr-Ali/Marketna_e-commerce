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

  /// Initializes the controller with the user's current information.
  ///
  /// This function is called when the controller is initialized.
  void _initialize() {
    User? currentUser = supabase.auth.currentUser;
    final userMetadata = currentUser?.userMetadata;

    // Check if the user is logged in
    if (currentUser == null) {
      debugPrint('User is not logged in');
      return;
    }

    // Set the user object to the current user
    user = currentUser;

    // Set the name controller text to the user's name
    nameController.text =
        DataConverter.getUserName(currentUser.userMetadata!) ?? '';

    // Set the email field to the user's email
    email = currentUser.email ?? '';

    // Set the country code to the user's country code
    countryCode = userMetadata?['country_code'] ?? '';

    // Set the phone controller text to the user's phone number
    phoneController.text = userMetadata?['phone'] ?? '';

    // Set the gender to the user's gender
    gender = userMetadata?['gender'] ?? '';

    // Set the date of birth to the user's date of birth
    dateBirth = userMetadata?['date_birth'] ?? '';

    // Update the UI
    update();
  }

  /// Shows a bottom sheet to select the source of the image.
  ///
  /// This function shows a bottom sheet with options to select the image from
  /// the camera, gallery, or delete the image. The selected option is then
  /// handled by the corresponding function.
  ///
  /// [selectedSource] The selected option from the bottom sheet.
  ///
  /// Returns a [Future] that resolves when the operation is completed.
  Future<void> selectImageSource() async {
    final String? selectedSource = await _main.openSelectImageSource();

    if (selectedSource == null) return;

    switch (selectedSource) {
      /// Selects the image from the camera.
      case 'camera':
        _selectImageFromCamera();
        break;

      /// Selects the image from the gallery.
      case 'gallery':
        _selectImageFromGallery();
        break;

      /// Deletes the image.
      case 'delete':
        _deleteImage(true);
        break;
      default:
        break;
    }
  }

  /// Selects an image from the gallery and updates the image path.
  ///
  /// This function uses the image service to select an image from the gallery.
  /// If an image is selected, it updates the imagePath and triggers a UI update.
  Future<void> _selectImageFromGallery() async {
    // Get the image file from the gallery
    final file = await _imageService.getImageFromGallery();

    // If no file is selected, return early
    if (file == null) return;

    // Update the image path with the selected file's path
    imagePath = file.path;

    // Update the UI
    update();
  }

  /// Selects an image from the camera and updates the image path.
  ///
  /// This function uses the [ImageService] to select an image from the camera.
  /// If an image is selected, it updates the [imagePath] and triggers a UI update.
  ///
  /// Returns a [Future] that resolves when the operation is completed.
  Future<void> _selectImageFromCamera() async {
    // Get the image file from the camera
    final XFile? imageFile = await _imageService.getImageFromCamera();

    // If no file is selected, return early
    if (imageFile == null) return;

    // Update the image path with the selected file's path
    imagePath = imageFile.path;

    // Update the UI
    update();
  }

  /// Clears the image path.
  ///
  /// This function sets the [imagePath] to null and triggers a UI update.
  Future<void> clearImagePath() async {
    imagePath = null;
    update();
  }

  /// Deletes the profile image from the bucket.
  ///
  /// This function takes a boolean [withUpdate] parameter. If [withUpdate] is true,
  /// it will update the user's avatar URL in the database and refresh the UI after
  /// deleting the image. If [withUpdate] is false, it will not update the user's avatar
  /// URL in the database and will not refresh the UI after deleting the image.
  ///
  /// Returns a [Future] that resolves when the operation is completed.
  Future<void> _deleteImage(bool withUpdate) async {
    debugPrint('deleteImage');

    // Check if the user is logged in
    if (user == null) {
      debugPrint('user_is_not_logged_in');
      return;
    }

    // Check if the user has an avatar URL
    if (user!.userMetadata == null) {
      debugPrint('user_metadata_is_null');
      return;
    }

    // Get the avatar URL from the user's metadata
    String? avatarUrl = DataConverter.getAvatarUrl(user!.userMetadata!);
    if (avatarUrl.isEmpty) return;

    imageIsLoading(true);
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
      // If [withUpdate] is true, refresh the UI
      if (withUpdate) {
        _initialize();
        _profileController.initializeUser();
      }
      imageIsLoading(false);
    }
  }

  /// Uploads the image to the Supabase Storage and then updates the user's avatar with the new image.
  ///
  /// This function will first delete the old image if exists, then it will upload the new image to the
  /// Supabase Storage. After the upload is complete, it will update the user's avatar with the new image.
  ///
  /// If an error occurs during the upload or update process, it will show a snackbar with the error
  /// message.
  ///
  /// - Parameter imagePath: The path of the image to upload.
  Future<void> _uploadImage() async {
    debugPrint('updateUser');

    if (imagePath == null) return;
    debugPrint('try delete old image');
    await _deleteImage(false);

    imageIsLoading(true);
    try {
      final String fileExtension = _main.getFileExtension(imagePath!);
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

      await supabase.auth.updateUser(UserAttributes(data: {'avatar': url}));
    } on StorageException catch (error) {
      // Show an error message if the upload or update process failed
      debugPrint(error.message.toString());
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      imagePath = null;
      imageIsLoading(false);
    }
  }

  /// Copies the email to the clipboard.
  ///
  /// This function will copy the email to the clipboard if the email is not null.
  /// If the email is null, it will do nothing.
  ///
  /// After copying the email to the clipboard, it will show a toast with the
  /// message 'email_copied'.
  void copyEmailToClipboard() {
    if (email == null) return;

    Clipboard.setData(ClipboardData(text: email!));
    CustomNotification.showToast(message: 'email_copied');
  }

  /// Updates the user's gender.
  ///
  /// This function sets the [gender] to the provided [value] and triggers a UI update.
  ///
  /// - Parameter value: The new gender value to be set.
  void updateGender(String value) {
    gender = value;
    update();
  }

  /// Updates the user's date of birth.
  ///
  /// This function sets the [dateBirth] to the provided [value] and triggers a
  /// UI update.
  ///
  /// - Parameter value: The new date of birth value in 'yyyy-MM-dd' format.
  void updateDateBirth(String value) {
    dateBirth = value;
    update(); // Refresh UI to reflect changes
  }

  /// Updates the user's profile information.
  ///
  /// This function will update the user's profile information in the Supabase
  /// database. It will first validate the form, then upload the image to the
  /// Supabase Storage, and finally update the user's information in the
  /// Supabase database.
  ///
  /// If the process is successful, it will show a snackbar with the message
  /// 'Profile updated successfully'.
  ///
  /// If an error occurs, it will show a snackbar with the error message.
  ///
  /// Finally, it will reset the form and set the loading state to false.
  Future<void> updateUser() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      // Upload the image to the Supabase Storage
      await _uploadImage();

      // Update the user's information in the Supabase database
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

      // Show a snackbar with the message 'Profile updated successfully'
      CustomNotification.showSnackbar(message: 'Profile updated successfully');
    } on AuthException catch (error) {
      // Show a snackbar with the error message
      CustomNotification.showSnackbar(message: error.message);
    } catch (error) {
      // Print the error to the console
      debugPrint(error.toString());
    } finally {
      // Reset the form and set the loading state to false
      _initialize();
      _profileController.initializeUser();
      isLoading.value = false;
    }
  }

  /// Updates the user's country code with the provided [code] and
  /// triggers a UI update.
  void updateCountryCode(code) {
    countryCode = code;
    update();
  }
}
