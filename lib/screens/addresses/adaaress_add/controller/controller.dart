import 'package:application/utils/import.dart';

class AddAddressController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _ = Get.find<ManageAddressesController>();

  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  String? country = 'سوريا';
  String? province = 'حلب';
  String? city = 'منبج';
  String? countryCode;
  String? flag;
  final addressNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final notesController = TextEditingController();

  /// Updates the current country code with the given [code].
  ///
  /// This function assigns the provided [code] to the `countryCode` field
  /// and triggers a UI update by calling the `update()` method.

  void updateCountryCode(code) {
    countryCode = code;
    update();
  }

  /// Determine the device's current location.
  ///
  /// Requests location service to be enabled if it is not already.
  /// Requests location permission if it is not already granted.
  ///
  /// Throws an error string if the location service is not enabled, or if the
  /// location permission is denied or denied forever.
  Future<Position> _determinePosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw AppConstants.UNABLE_LOCATION_SERVICES;
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final requestedPermission = await Geolocator.requestPermission();
      if (requestedPermission == LocationPermission.denied) {
        throw AppConstants.LOCATION_PERMISSIONS_DENIED;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw AppConstants.LOCATION_PERMISSIONS_DENIED_REQUEST_PERMISSIONS;
    }

    return await Geolocator.getCurrentPosition();
  }

  /// Adds a new address for the current user.
  ///
  /// This function collects the user's input from form fields and determines
  /// the device's current location to create a new address entry. It then
  /// inserts the address into the database and provides feedback to the user.
  Future<void> addAddress() async {
    // Set loading state to true
    isLoading.value = true;

    // Get the current user ID
    final userId = _supabase.auth.currentUser!.id;

    // Determine the current position
    final position = await _determinePosition();

    // Validate form inputs
    if (!formKey.currentState!.validate()) {
      isLoading.value = false;
      return;
    }

    try {
      // Create an Address object with user input and location data
      final address = Address(
        id: 56,
        customerId: userId,
        addressName: addressNameController.text,
        streetAddress: streetAddressController.text,
        country: country,
        province: province,
        city: city,
        countryCode: countryCode,
        phoneNumber: phoneNumberController.text,
        flag: countryCode,
        notes: notesController.text,
        location: {
          AppConstants.LATITUDE: position.latitude,
          AppConstants.LONGITUDE: position.longitude,
        },
      );

      // Insert the address into the database
      await _supabase
          .from(KEYS.ADDRESSES_TABLE)
          .insert(address.toJson())
          .whenComplete(() {
            // Show success notification
            CustomNotification.showSnackbar(
              message: AppConstants.ADDRESS_ADDED_SUCCESSFULLY,
            );
            // Dispose controllers and reinitialize data
            _disposeControllers();
            _.loadAddresses();
          });
    } catch (error) {
      // Handle errors and show error notification
      CustomNotification.showSnackbar(message: AppConstants.DATA_SENDING_ERROR);
      debugPrint(error.toString());
    } finally {
      // Set loading state to false
      isLoading.value = false;
    }
  }

  /// Dispose all the controllers used in the form.
  ///
  /// This is useful when the user submits the form and the form data should be
  /// cleared.
  void _disposeControllers() {
    // Clear the text fields
    addressNameController.clear();
    streetAddressController.clear();
    phoneNumberController.clear();
    notesController.clear();
    // Update the UI to reflect the changes
    update();
  }
}
