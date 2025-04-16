import 'package:application/utils/import.dart';

class AddAddressController extends GetxController {
  final _ = Get.find<ManageAddressesController>();

  final _supabase = Supabase.instance.client;
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  final addressNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  String country = '';
  String stateProvince = '';
  String city = '';
  String? countryCode;
  final phoneNumberController = TextEditingController();
  final notesController = TextEditingController();

  void updateCountryCode(code) {
    countryCode = code;
    update();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Unable_Location_services.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location_permissions_denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location_permissions_denied_request_permissions');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> addAdress() async {
    debugPrint('Add New Address');

    isLoading.value = true;

    final userId = _supabase.auth.currentUser!.id;

    final selectedlocation = await _determinePosition();

    if (!formKey.currentState!.validate()) return;

    try {
      final AddressModel addressModel = AddressModel(
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
          'latitude': selectedlocation.latitude,
          'longitude': selectedlocation.longitude,
        },
      );

      await _supabase
          .from(KEYS.addressesTable)
          .insert(addressModel.toJson())
          .whenComplete(() {
            CustomNotification.showSnackbar(
              message: 'address_added_successfully',
            );
            _dispose();
            _.initialize();
          });
    } catch (error) {
      debugPrint(error.toString());
      CustomNotification.showSnackbar(message: 'data_sending_error');
    } finally {
      isLoading.value = false;
    }
  }

  void _dispose() {
    debugPrint('Clear Text Controllers');
    addressNameController.clear();
    streetAddressController.clear();
    // city = null;
    // stateProvince = null;
    // country = null;
    phoneNumberController.clear();
    notesController.clear();
    update();
  }
}
