import 'package:application/utils/import.dart';

class EditProfileController extends GetxController {
  /// Variables
  final _supabase = Supabase.instance.client;
  final _mainController = EditProfileMainController();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final statusMessageController = TextEditingController();
  final phoneController = TextEditingController();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  final RxBool _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;
  final RxBool _isUpdateImageLoading = false.obs;
  bool get isUpdateImageLoading => _isUpdateImageLoading.value;
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
      UserMetaDataModel userMetadata = UserMetaDataModel.fromJson(
        currentUser.userMetadata ?? {},
      );
      _email.value = currentUser.email ?? '';
      _countryCode.value = userMetadata.countryCode ?? '';
      _gender.value = userMetadata.gender ?? 'Not Specified';
      _dateBirth.value = userMetadata.dateBirth ?? '';
      nameController.text = userMetadata.name ?? '';
      statusMessageController.text = userMetadata.statusMessage ?? '';
      phoneController.text = userMetadata.phone ?? '';
    } finally {
      _isLoading.value = false;
    }
  }

  /// Copies the email to the clipboard.
  void copyEmailToClipboard(String? email) {
    if (email == null) return;
    Clipboard.setData(ClipboardData(text: email));
    CustomNotification.showToast(message: 'Email copied to clipboard');
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
      _dateBirth.value = DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }
}
//   void _initialize() {
//     User? currentUser = supabase.auth.currentUser;
//     final userMetadata = currentUser?.userMetadata;

//     // Check if the user is logged in
//     if (currentUser == null) return;

//     // Set the user object to the current user
//     user = currentUser;

//     // Set the name controller text to the user's name
//     nameController.text = DataConverter.getUserName(currentUser.userMetadata!);

//     // Set the email field to the user's email
//     email = currentUser.email;

//     // Set the country code to the user's country code

//     // Set the country code controller text to the user's country code
//     selectedCountryCode = userMetadata?[ConstantsText.COUNTRY_CODE];

//     // Set the phone controller text to the user's phone number
//     phoneController.text = userMetadata?[ConstantsText.PHONE] ?? '';

//     // Set the gender to the user's gender
//     gender = userMetadata?[ConstantsText.GENDER] ?? '';

//     // Set the date of birth to the user's date of birth
//     dateBirth = userMetadata?[ConstantsText.DATE_BIRTH] ?? '';

//     // Update the UI
//     update();
//   }

//   /// Deletes the profile image from the bucket.
//   Future<void> deleteImage(String? imageUrl) async {
//     try {
//       if (imageUrl == null || imageUrl.isEmpty) return;

//       final String fileName = imageUrl.split('/').last;
//       final String folderName = supabase.auth.currentUser!.id;

//       await supabase.storage
//           .from(KEYS.USERS_BUCKET)
//           .remove(['${KEYS.PROFILE_FOLDER}/$folderName/$fileName'])
//           .whenComplete(
//             () async => await supabase.auth.updateUser(
//               UserAttributes(data: {ConstantsText.AVATAR: null}),
//             ),
//           );

//       debugPrint('Image deleted successfully');
//     } on StorageException catch (error) {
//       debugPrint(error.message.toString());
//       CustomNotification.showSnackbar(message: error.message);
//     } catch (error) {
//       // Handle other errors and show error message in a snackbar
//       CustomNotification.showSnackbar(
//         message: '${ConstantsText.ERROR.tr} $error',
//       );
//       debugPrint(error.toString());
//     }
//   }

//   /// Uploads the image to the Supabase Storage
//   Future<String?> _uploadImage(String? imagePath) async {
//     try {
//       if (imagePath == null) return null;
//       _imageLoading.value = true;

//       final String fileExtension = DataConverter.getFileExtension(imagePath);
//       final String fileName = Uuid().v1() + fileExtension;
//       final String folderName = user!.id;

//       // Upload the image to the Supabase Storage
//       await supabase.storage
//           .from(KEYS.USERS_BUCKET)
//           .upload(
//             '${KEYS.PROFILE_FOLDER}/$folderName/$fileName',
//             File(imagePath),
//           );

//       // Update the user's avatar with the new image
//       String url = supabase.storage
//           .from(KEYS.USERS_BUCKET)
//           .getPublicUrl('${KEYS.PROFILE_FOLDER}/$folderName/$fileName');

//       return url;
//     } on StorageException catch (error) {
//       throw AppException(error.message);
//     } catch (error) {
//       throw AppException('An error occurred while uploading the image');
//     } finally {
//       _imageLoading.value = false;
//     }
//   }

//   /// Copies the email to the clipboard.
//   void copyEmailToClipboard() {
//     if (email == null) return;

//     Clipboard.setData(ClipboardData(text: email!));
//     CustomNotification.showToast(message: 'Email copied to clipboard');
//   }

//   /// updates Country Code
//   void updateCountryCode(String? value) {
//     selectedCountryCode = value;
//     update();
//   }

//   /// Updates the user gender.
//   void updateGender(String value) {
//     gender = value;
//     update();
//   }

//   /// Updates the user date of birth.
//   void updateDateBirth(String value) {
//     dateBirth = value;
//     update(); // Refresh UI to reflect changes
//   }

//   /// Updates the user profile information.
//   Future<void> updateUser() async {
//     debugPrint(phoneController.text.trim());
//     phoneErrorMessage = Validators.phoneNumber(phoneController.text);
//     countryCodeErrorMessage = Validators.countryCode(selectedCountryCode ?? '');
//     update();

//     if (!formKey.currentState!.validate() ||
//         phoneErrorMessage != null ||
//         countryCodeErrorMessage != null) {
//       return;
//     }

//     isLoading.value = true;

//     try {
//       // Upload the image to the Supabase Storage
//       await _uploadImage();

//       // Update the user's information in the Supabase database
//       await supabase.auth.updateUser(
//         UserAttributes(
//           data: {
//             ConstantsText.DISPLAY_NAME: nameController.text.trim(),
//             ConstantsText.USER_NAME: DataConverter.removeTextAfterAt(
//               email!.trim(),
//             ),
//             ConstantsText.COUNTRY_CODE: selectedCountryCode,
//             ConstantsText.PHONE: phoneController.text.trim(),
//             ConstantsText.GENDER: gender,
//             ConstantsText.DATE_BIRTH: dateBirth,
//           },
//         ),
//       );

//       // Show a snackbar with the message 'Profile updated successfully'
//       CustomNotification.showSnackbar(
//         message: ConstantsText.PROFILE_UPDATED_SUCCESSFULLY,
//       );
//     } on AuthException catch (error) {
//       // Show a snackbar with the error message
//       CustomNotification.showSnackbar(message: error.message);
//     } catch (error) {
//       // Handle other errors and show error message in a snackbar
//       CustomNotification.showSnackbar(
//         message: '${ConstantsText.ERROR.tr} $error',
//       );
//       debugPrint(error.toString());
//     } finally {
//       // Reset the form and set the loading state to false
//       _initialize();
//       isLoading.value = false;
//       update();
//     }
//   }
// }
