import 'package:application/utils/import.dart';

class AddAddressController extends GetxController {
  // AddAddressController({this.addressId});
  // final int? addressId;

  final _supabase = Supabase.instance.client;
  final _ = Get.find<ManageAddressesController>();

  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  int? addressId;
  String? country;
  String? province;
  String? city;
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
    debugPrint(countryCode);
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

  Future<void> addAddress() async {
    isLoading.value = true;

    final currentUserId = _supabase.auth.currentUser?.id;
    if (currentUserId == null) {
      isLoading.value = false;
      return;
    }

    if (!formKey.currentState!.validate()) {
      isLoading.value = false;
      return;
    }

    try {
      final currentPosition = await _determinePosition();

      final newAddress = Address(
        customerId: currentUserId,
        addressName: addressNameController.text,
        streetAddress: streetAddressController.text,
        country: country,
        province: province,
        city: city,
        countryCode: countryCode,
        phoneNumber: phoneNumberController.text,
        flag: flag,
        notes: notesController.text,
        location: {
          AppConstants.LATITUDE: currentPosition.latitude,
          AppConstants.LONGITUDE: currentPosition.longitude,
        },
      );

      if (addressId != null) {
        await _supabase
            .from(KEYS.ADDRESSES_TABLE)
            .update(newAddress.toJson())
            .eq('id', addressId!)
            .whenComplete(() {
              CustomNotification.showSnackbar(
                message: AppConstants.ADDRESS_ADDED_SUCCESSFULLY,
              );
              _.loadAddresses();
            });
      } else {
        await _supabase
            .from(KEYS.ADDRESSES_TABLE)
            .insert(newAddress.toJson())
            .whenComplete(() {
              CustomNotification.showSnackbar(
                message: AppConstants.ADDRESS_ADDED_SUCCESSFULLY,
              );
              _disposeControllers();
              _.loadAddresses();
            });
      }
    } catch (error) {
      CustomNotification.showSnackbar(message: AppConstants.DATA_SENDING_ERROR);
      debugPrint(error.toString());
    } finally {
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
