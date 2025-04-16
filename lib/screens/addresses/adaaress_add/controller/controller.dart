import 'package:application/utils/import.dart';

class AddAddressController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _ = Get.find<ManageAddressesController>();

  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  String? country;
  String? stateProvince;
  String? city;
  String? countryCode;
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
      throw 'Unable_Location_services.';
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final requestedPermission = await Geolocator.requestPermission();
      if (requestedPermission == LocationPermission.denied) {
        throw 'Location_permissions_denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location_permissions_denied_request_permissions';
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> addAddress() async {
    isLoading.value = true;

    final userId = _supabase.auth.currentUser!.id;

    final position = await _determinePosition();

    if (!formKey.currentState!.validate()) {
      isLoading.value = false;
      return;
    }

    try {
      final address = Address(
        customerId: userId,
        addressName: addressNameController.text,
        streetAddress: streetAddressController.text,
        city: city,
        stateProvince: stateProvince,
        country: country,
        countryCode: countryCode,
        phoneNumber: phoneNumberController.text,
        notes: notesController.text,
        location: {
          'latitude': position.latitude,
          'longitude': position.longitude,
        },
      );

      await _supabase
          .from(KEYS.ADDRESSES_TABLE)
          .insert(address.toJson())
          .whenComplete(() {
            CustomNotification.showSnackbar(
              message: 'address_added_successfully',
            );
            _disposeControllers();
            _.initialize();
          });
    } catch (error) {
      CustomNotification.showSnackbar(message: 'data_sending_error');
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
