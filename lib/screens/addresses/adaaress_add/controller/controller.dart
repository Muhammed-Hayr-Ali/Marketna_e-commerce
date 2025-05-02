import 'package:application/utils/import.dart';

class AddAddressController extends GetxController {
  // AddAddressController({this.addressId});
  // final int? addressId;

  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();
  final _ = Get.find<ManageAddressesController>();

  /// Form key to validate the address form.
  final formKey = GlobalKey<FormState>();

  /// Text controllers for the address fields.
  final addressNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final notesController = TextEditingController();

  /// Selected country, province, and city variables.
  String? selectedCountry;
  String? selectedCountryCode;
  String? selectedCountryFlag;
  String? selectedProvince;
  String? selectedCity;

  String? local = 'en';
  RxBool isLoading = false.obs;

  int? addressId;

  String? countryErrorMessage;
  String? provinceErrorMessage;
  String? cityErrorMessage;
  String? countryCodeErrorMessage;
  String? phoneErrorMessage;

  @override
  void onInit() async {
    local =
        _storage.read(STORAGE_KEYS.LOCALE) ?? Get.deviceLocale!.languageCode;

    super.onInit();
  }

  /// Initializes the controller and sets the initial values for the address fields.
  void loadAddress(Address? address) async {
    if (address == null) return;
    addressId = address.id;
    addressNameController.text = address.addressName ?? '';
    streetAddressController.text = address.street ?? '';
    phoneNumberController.text = address.phoneNumber ?? '';
    notesController.text = address.notes ?? '';

    selectedCountry = address.country;
    selectedProvince = address.province;
    selectedCity = address.city;
    selectedCountryCode = address.countryCode;
    selectedCountryFlag = address.flag;

    update();
  }

  Future<void> onChangedCountry(Country value) async {
    selectedCountry = local != 'ar' ? value.name : value.nameAr;
    selectedCountryCode = value.code;
    selectedCountryFlag = value.flag;
    selectedProvince = null;
    selectedCity = null;
    update();
  }

  void onChangedProvince(Province value) {
    selectedProvince = local != 'ar' ? value.name : value.nameAr;
    selectedCity = null;
    update();
  }

  void onChangedCity(City value) {
    selectedCity = value.name;
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
      throw ConstantsText.UNABLE_LOCATION_SERVICES;
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final requestedPermission = await Geolocator.requestPermission();
      if (requestedPermission == LocationPermission.denied) {
        throw ConstantsText.LOCATION_PERMISSIONS_DENIED;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw ConstantsText.LOCATION_PERMISSIONS_DENIED_REQUEST_PERMISSIONS;
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> addAddress() async {
    final currentUserId = _supabase.auth.currentUser?.id;
    if (currentUserId == null) {
      isLoading.value = false;
      return;
    }

    countryErrorMessage = Validators.country(selectedCountry ?? '');
    provinceErrorMessage = Validators.province(selectedProvince ?? '');
    cityErrorMessage = Validators.city(selectedCity ?? '');
    countryCodeErrorMessage = Validators.countryCode(selectedCountryCode ?? '');
    phoneErrorMessage = Validators.phoneNumber(phoneNumberController.text);
    update();

    if (!formKey.currentState!.validate() ||
        countryErrorMessage != null ||
        provinceErrorMessage != null ||
        cityErrorMessage != null ||
        countryCodeErrorMessage != null ||
        phoneErrorMessage != null) {
      return;
    }

    try {
      isLoading.value = true;

      final currentPosition = await _determinePosition();

      final newAddress = Address(
        userId: currentUserId,
        addressName: addressNameController.text,
        street: streetAddressController.text,
        country: selectedCountry,
        province: selectedProvince,
        city: selectedCity,
        countryCode: selectedCountryCode,
        phoneNumber: phoneNumberController.text,
        flag: selectedCountryFlag,
        notes: notesController.text,
        location: {
          ConstantsText.LATITUDE: currentPosition.latitude,
          ConstantsText.LONGITUDE: currentPosition.longitude,
        },
      );

      if (addressId != null) {
        await _supabase
            .from(KEYS.ADDRESSES_TABLE)
            .update(newAddress.toJson())
            .eq('id', addressId!);
      } else {
        await _supabase.from(KEYS.ADDRESSES_TABLE).insert(newAddress.toJson());
      }

      _.loadAddresses();

      if (addressId == null) {
        _disposeControllers();
        Get.back();
      }
    } catch (error) {
      CustomNotification.showSnackbar(
        message: ConstantsText.DATA_SENDING_ERROR,
      );
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
    selectedCountry = null;
    selectedCountryCode = null;
    selectedCountryFlag = null;
    selectedProvince = null;
    selectedCity = null;
    countryErrorMessage = null;
    provinceErrorMessage = null;
    cityErrorMessage = null;

    // Update the UI to reflect the changes
    update();
  }
}
